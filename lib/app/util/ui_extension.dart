import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UIExtension {
  // user defined function
  static void showAlertDialog(BuildContext context, String message,
      {String? buttonText, Function? onClose}) {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
//          title: new Text("Message"),
          content: new Text(message),
          actions: <Widget>[
            new TextButton(
              child: new Text(buttonText ?? "OK"),
              onPressed: () {
                Navigator.of(context).pop();

                if (onClose != null) {
                  onClose();
                  // Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  static void showConfirmDialog(BuildContext context, String message,
      {String? buttonText, Function? onConfirm}) {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
//          title: new Text("Message"),
          content: new Text(message),
          actions: <Widget>[
            new TextButton(
              child: new Text(buttonText ?? "OK"),
              onPressed: () {
                Navigator.of(context).pop();

                onConfirm?.call();
              },
            ),
            new TextButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
