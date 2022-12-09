import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokemon_app/app/model/pokemon_model.dart';
import 'package:pokemon_app/app/util/color.dart';
import 'package:pokemon_app/app/widget/glassWidget.dart';
import 'package:pokemon_app/app/widget/properties_widget.dart';
import 'package:pokemon_app/app/widget/text_widget.dart';

class DetailScreen extends StatefulWidget {
  final PokemonModel? pokemonModel;
  DetailScreen({super.key, this.pokemonModel});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: secondaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black54,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.star_border,
                color: Colors.blue,
              ))
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText(widget.pokemonModel!.category, Colors.blue),
            Center(
              child: Image(
                height: 200,
                image: NetworkImage(widget.pokemonModel!.imageurl.toString()),
                fit: BoxFit.cover,
              ),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: titleText(widget.pokemonModel!.name, Colors.black),
            )),
            Text(
              widget.pokemonModel!.xdescription.toString(),
              style: TextStyle(color: Colors.blueGrey),
            ),
            glassWidget(
              height: 200,
              weight: widget.pokemonModel!.weight,
              type: widget.pokemonModel!.typeofpokemon![0],
              speed: widget.pokemonModel!.speed.toString(),
              hp: widget.pokemonModel!.hp.toString(),
              attack: widget.pokemonModel!.defense.toString(),
              defense: widget.pokemonModel!.defense.toString(),
            ),
            propertiesWidget(
              powerTitle: "Special Attack",
              power: widget.pokemonModel!.specialAttack.toString(),
              color: Colors.pink.withOpacity(0.2),
            ),
            propertiesWidget(
              powerTitle: "Abilities",
              power: widget.pokemonModel!.abilities![0],
              color: Colors.blue.withOpacity(0.2),
            ),
            propertiesWidget(
              powerTitle: "Weakness",
              power: widget.pokemonModel!.weaknesses![0],
              color: Colors.orange.withOpacity(0.2),
            ),
          ],
        ),
      )),
    );
  }
}
