import 'dart:async';
import 'package:flutter/material.dart';
import 'package:magic_bricks/Screens/Onboarding_Screen/onboarding_screen.dart';
import 'package:magic_bricks/Widgets/MainNavigator.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay to represent loading or initialization process
    Timer(
      Duration(seconds: 3),
      () {
        // Navigate to the next screen after the splash screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Onboarding_Screen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple,
            Colors.deepPurpleAccent,
          ],
        )),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "magicbricks",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "India's No. 1 Property App ",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
