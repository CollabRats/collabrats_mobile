import 'package:flutter/material.dart';

class Presenters {
  static void showSnackBar(
    BuildContext context,
    String msg, {
    bool isSucess = false,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(10),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(msg),
      backgroundColor: isSucess ? Colors.green : Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
