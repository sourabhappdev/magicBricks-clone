import 'package:flutter/material.dart';

import '../Screens/Search_Screen/Search_Screen.dart';


class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Search_Screen(),
            ));
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black45,
            ),
          ),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(Icons.search),
              SizedBox(
                width: 20,
              ),
              Text("Search Property"),
            ],
          ),
        ),
      ),
    );
  }
}