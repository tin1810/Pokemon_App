import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/app/model/pokemon_model.dart';
import 'package:pokemon_app/app/util/color.dart';
import 'package:pokemon_app/app/util/failure.dart';
import 'package:pokemon_app/app/util/functions.dart';
import 'package:pokemon_app/app/view/home/bloc/home_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Failure? failure;
  bool loading = false;
  List<PokemonModel> pokemonList = [];
  List<dynamic> foundPokemon = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(const GetHomeEvent());
  }

  void searchList(String searchs) {
    List<dynamic> results = [];

    if (searchs.isEmpty) {
      results = pokemonList;
    } else {
      results = pokemonList
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(searchs.toLowerCase()))
          .toList();
    }
    foundPokemon = results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 20,
            )),
        elevation: 0,
        backgroundColor: secondaryColor,
        title: TextField(
          cursorColor: Colors.grey,
          textInputAction: TextInputAction.search,
          onChanged: (value) {
            setState(() {
              searchList(value);
            });
          },
          autofocus: true,
          decoration: const InputDecoration(
              suffixIcon: Icon(
            Icons.search,
            size: 20,
            color: Colors.black,
          )),
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) => _mapStateToActions(state),
        builder: (context, state) {
          return Column(
            children: [
              Flexible(
                  child: ListView.builder(
                      itemCount: foundPokemon.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 10,
                          ),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                  image: NetworkImage(
                                      pokemonList[index].imageurl.toString())),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    pokemonList[index].name.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    pokemonList[index].id.toString(),
                                  ),
                                  Text(
                                    pokemonList[index].typeofpokemon![0],
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }))
            ],
          );
        },
      ),
    );
  }

  void _mapStateToActions(HomeState state) {
    failure = NoException();
    loading = false;
    if (Functions.modalIsShown) {
      Navigator.pop(context);
      Functions.modalIsShown = false;
    }
    if (state is GetHomeFailed) {
      failure = state.failure;
      loading = false;
      if (state.failure is BottomPlacedException) {
        Functions.showBottomMessage(context, failure!.code);
      }
    } else if (state is GetHomeLoading) {
      loading = true;
    } else if (state is GetHomeSuccess) {
      loading = false;
      pokemonList = state.pokemonList;
    }
  }
}
