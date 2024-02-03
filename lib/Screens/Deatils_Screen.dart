import 'package:flutter/material.dart';
import 'package:magic_bricks/Widgets/AppBar/AppBar.dart';

class Details_Screen extends StatefulWidget {
  const Details_Screen({super.key});

  @override
  State<Details_Screen> createState() => _Details_ScreenState();
}

class _Details_ScreenState extends State<Details_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context),
    );
  }
}
