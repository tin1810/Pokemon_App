import 'package:flutter/cupertino.dart';

Widget titleText(String? name, Color? color) {
  return Text(
    name.toString(),
    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color),
  );
}
