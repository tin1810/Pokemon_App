import 'package:flutter/material.dart';
import 'package:pokemon_app/app/model/pokemon_model.dart';

Widget GridWidget({String? name, String? id, type, String? url, Color? color}) {
  return Container(
    margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),

    // decoration: pokemonModel?.typeofpokemon == ["Grass", "Poison"]
    //     ? BoxDecoration(color: Colors.red)
    //     : BoxDecoration(color: Colors.yellow),
    child: Column(
      children: [
        Image(
          height: 100,
          image: NetworkImage(
            url.toString(),
          ),
          fit: BoxFit.cover,
        ),
        Text(
          name.toString(),
          style: TextStyle(fontSize: 16),
        ),
        Text(id.toString()),
        Text(
          type,
          style: TextStyle(color: Colors.blue),
        ),
      ],
    ),
  );
}
