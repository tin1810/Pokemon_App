import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/app/model/pokemon_model.dart';
import 'package:pokemon_app/app/util/color.dart';
import 'package:pokemon_app/app/util/failure.dart';
import 'package:pokemon_app/app/util/functions.dart';
import 'package:pokemon_app/app/util/ui_extension.dart';
import 'package:pokemon_app/app/view/home/bloc/home_bloc.dart';
import 'package:pokemon_app/app/view/home/screen/grid_widget.dart';
import 'package:pokemon_app/app/widget/appbar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Failure? failure;
  bool loading = false;
  List<PokemonModel> pokemonList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context)..add(GetHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(130), child: appBar()),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) => _mapStateToActions(state),
          builder: (context, state) {
            return BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return GridView.builder(
                    itemCount: pokemonList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return GridWidget();
                    });
              },
            );
          },
        ));
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
