import 'package:flutter/material.dart';

class TextConstants {
  static TextConstants? _instance;
  TextConstants._();
  static TextConstants get instance {
    _instance ??= TextConstants._();
    return _instance!;
  }

  final TextStyle userNameTextStyle = const TextStyle(
      color: Colors.black, letterSpacing: 1, fontWeight: FontWeight.w600);
  final TextStyle lightBoldHeading =
      const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold);
  final TextStyle boldDarkHeading = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25);
  final TextStyle boldDarkMedium = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23);
  final TextStyle boldDarkSmall = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19);
}
