import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastState { success, error }

void showToast(String strMsg, [ToastState state = ToastState.error]) {
  Color backgroundColor = (state == ToastState.success) ? Colors.green : Colors.red;

  Fluttertoast.showToast(
    msg: strMsg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    backgroundColor: backgroundColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}