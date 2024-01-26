import 'package:flutter/material.dart';
import 'package:magic_bricks/Screens/Login_Screen/Login_Screen.dart';
import 'package:magic_bricks/Screens/Login_Screen/CreateProfile_Screen.dart';
import 'package:magic_bricks/Screens/Splash_Screen/Splash_Screen.dart';
import 'package:magic_bricks/Widgets/MainNavigator.dart';
import 'package:magic_bricks/test..dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash_Screen(),
    );
  }
}
