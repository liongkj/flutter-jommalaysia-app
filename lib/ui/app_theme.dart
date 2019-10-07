import 'package:flutter/material.dart';

final appTheme = ThemeData(
  primarySwatch: Colors.pink,
  accentColor: Colors.amber,
  canvasColor: Color.fromRGBO(255, 254, 229, 1),
  fontFamily: 'OpenSans',
  textTheme: ThemeData.light().textTheme.copyWith(
        title: TextStyle(
          fontSize: 24,
          fontFamily: 'OpenSans-ExtraBold',
        ),
        body1: TextStyle(
          color: Color.fromARGB(20, 51, 51, 1),
        ),
        body2: TextStyle(
          color: Color.fromARGB(20, 51, 51, 1),
        ),
      ),
);
