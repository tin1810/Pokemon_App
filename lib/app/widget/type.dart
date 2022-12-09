import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget typeWidget({String? title, String? subtitle}) {
  return Column(
    children: [
      Text(
        title.toString(),
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
      Text(
        subtitle.toString(),
      ),
    ],
  );
}
