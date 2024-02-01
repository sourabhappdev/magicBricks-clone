import 'package:flutter/material.dart';
import 'package:magic_bricks/Constants/Constants.dart';
import 'package:magic_bricks/Widgets/AppBar/AppBar.dart';
import '../../Components/PropertyCard.dart';
import '../../Models/PropertyModel.dart';

class Search_Screen extends StatefulWidget {
  const Search_Screen({super.key});

  @override
  State<Search_Screen> createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context),
      body: Column(
        children: [
          SearchBar(
            
            leading: Icon(Icons.search),
            hintText: "Search  Property",
          ),
        ],
      ),
    );
  }
}
