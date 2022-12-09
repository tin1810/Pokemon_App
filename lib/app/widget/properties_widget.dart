import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget propertiesWidget({String? powerTitle, String? power, Color? color}) {
  return Container(
    height: 55,
    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          powerTitle.toString(),
          style: TextStyle(fontSize: 17),
        ),
        Text(power.toString()),
      ],
    ),
  );
//   return Stack(
//     children: [
//       Container(
//         height: 55,
// // padding: EdgeInsets.only(left: 5,top: 5),
//         width: double.infinity,
//         decoration: BoxDecoration(
//             color: Colors.white70.withOpacity(0.2),
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(10),
//                 bottomRight: Radius.circular(10),
//                 topLeft: Radius.circular(50),
//                 bottomLeft: Radius.circular(50)),
//             border: Border.all(color: Colors.black12)),
//         child: Align(
//             alignment: Alignment.centerLeft, child: Text(power.toString())),
//       ),
//       Positioned(
//           child: Container(
//         height: 55,
//         width: 180,
//         decoration: BoxDecoration(
//           color: Colors.blue.withOpacity(0.3),
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: Text(powerTitle.toString()),
//       ))
//     ],
//   );
}
