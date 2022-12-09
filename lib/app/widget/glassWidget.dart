import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/app/widget/type.dart';

Widget glassWidget(
    {double? height,
    String? weight,
    String? type,
    String? speed,
    String? hp,
    String? attack,
    String? defense}) {
  return ClipRect(
    child: Container(
      height: height,
      margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white70.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blueGrey.shade100)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              typeWidget(title: weight, subtitle: "Weight"),
              typeWidget(title: type, subtitle: "Type"),
              typeWidget(title: speed, subtitle: "Speed"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              typeWidget(title: hp, subtitle: "HP"),
              typeWidget(title: attack, subtitle: "Attack"),
              typeWidget(title: defense, subtitle: "Defense"),
            ],
          ),
        ],
      ),
    ),
  );
}
