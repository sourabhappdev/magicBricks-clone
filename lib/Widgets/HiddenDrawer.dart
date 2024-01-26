import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:magic_bricks/Screens/Favourite_Screen/Favourite_Screen.dart';
import 'package:magic_bricks/Screens/Home_Screen/Home_Screen.dart';
import 'package:magic_bricks/Screens/Search_Screen/Search_Screen.dart';


class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {

  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(ItemHiddenMenu(name: "Home", baseStyle: TextStyle(), selectedStyle: TextStyle()), Home_Screen(),),
      ScreenHiddenDrawer(ItemHiddenMenu(name: "Search", baseStyle: TextStyle(), selectedStyle: TextStyle()), Search_Screen(),),
      ScreenHiddenDrawer(ItemHiddenMenu(name: "Fav", baseStyle: TextStyle(), selectedStyle: TextStyle()), Favourite_Screen(),),

    ];
  }
  @override
  Widget build(BuildContext context) {



    return HiddenDrawerMenu(
      screens: _pages,
      initPositionSelected: 0,
        backgroundColorMenu: Colors.deepPurple);
  }
}
