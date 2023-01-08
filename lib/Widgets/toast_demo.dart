import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void showFlutterToast(String s)
{
  Fluttertoast.showToast(
      msg: s,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.black,
      fontSize: 16.0
  );
}