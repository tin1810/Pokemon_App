import 'dart:io';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:pokemon_app/app/util/device_config.dart';

class Functions {
  static void replacementTransition(context, Widget screen,
      [Duration? duration]) {
    Future.delayed(duration ?? Duration(milliseconds: 300), () async {
      await Navigator.pushReplacement(context,
          PageTransition(child: screen, type: PageTransitionType.fade));
    });
  }

  // static void transition(context, Widget screen, [Duration? duration]) {
  //   Future.delayed(duration ?? Duration(milliseconds: 300), () async {
  //     await Navigator.pushReplacement(context,
  //         PageTransition(child: screen, type: PageTransitionType.fade));
  //   });
  // }

  static void transition(context, Widget screen, [Duration? duration]) {
    Future.delayed(duration ?? Duration(milliseconds: 300), () async {
      await Navigator.push(context,
          PageTransition(child: screen, type: PageTransitionType.fade));
    });
  }

  static List<String> getAvatarsPaths() {
    return [
      'assets/images/avatars/avatar5.png',
      'assets/images/avatars/avatar3.png',
      'assets/images/avatars/avatar4.png',
      'assets/images/avatars/avatar1.jpg',
      'assets/images/avatars/avatar2.png',
    ];
  }

  static final String femaleAvaterPath = 'assets/images/avatars/avatar3.png';

  static bool modalIsShown = false;

  static void showBottomMessage(BuildContext context, String message,
      {bool isDismissible = true}) async {
    final deviceData = DeviceData.init(context);
    print("message : " + message);

    showModalBottomSheet(
        isDismissible: isDismissible,
        backgroundColor: Color.fromRGBO(0, 55, 123, 1), //need to change
        barrierColor: Colors.black26,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              return isDismissible;
            },
            child: Padding(
              padding: EdgeInsets.all(deviceData.screenWidth * 0.05),
              child: Text(
                message,
                style: TextStyle(
                    fontSize: deviceData.screenHeight * 0.018,
                    color: Colors.white),
              ),
            ),
          );
        }).then((value) {
      modalIsShown = false;
    });
    modalIsShown = true;
  }

  static Future<bool> getNetworkStatus({Duration? duration}) async {
    await Future.delayed(duration ?? Duration(milliseconds: 300));
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static String convertDate(String timestamp) {
    int hour = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp)).hour;
    int min = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp)).minute;
    int day = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp)).day;
    int month = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp)).month;
    int year = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp)).year;
    int currentDay = DateTime.now().day;
    int currentMonth = DateTime.now().month;
    int currentYear = DateTime.now().year;
    if (day == currentDay && month == currentMonth && year == currentYear) {
      String afternoon = "AM";
      if (hour >= 12) {
        afternoon = "PM";
        hour = hour - 12;
      }
      if (min < 10) {
        return hour.toString() + ":" + "0" + min.toString() + " " + afternoon;
      }
      return hour.toString() + ":" + min.toString() + " " + afternoon;
    } else {
      return month.toString() + "/" + day.toString();
    }
  }

  static String shortenMessage(String value, int maxLetters) {
    if (value.length > maxLetters) {
      return value.substring(0, maxLetters) + '...';
    }
    return value;
  }

  static String getFirstName(String value) {
    return value.split(" ")[0];
  }

  static String shortenName(String value, int maxLetters) {
    return value.split(" ")[0];
  }
}
