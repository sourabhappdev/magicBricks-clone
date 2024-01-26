import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final String text;

  CustomAppBar({required this.text})
      : super(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
          title: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          elevation: 0.0,
          automaticallyImplyLeading: false,
        );
}
