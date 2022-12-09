// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pokemon_app/app/model/pokemon_model.dart';
import 'package:pokemon_app/app/util/color.dart';
import 'package:pokemon_app/app/view/search/search_screen.dart';

Widget appBar(BuildContext context) {
  return AppBar(
    backgroundColor: bgColor,
    elevation: 0,
    flexibleSpace: Container(
      padding: const EdgeInsets.only(top: 40, right: 15, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Which Pokemon \nare you looking for..?",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                  wordSpacing: 5),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              icon: Icon(Icons.search))
        ],
      ),
    ),
  );
}
