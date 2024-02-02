import 'package:flutter/material.dart';
import 'package:magic_bricks/Screens/Results_Screen/Results_Screen.dart';

import '../Constants/Constants.dart';

class CategoryButton extends StatelessWidget {
  final String category;

  CategoryButton({required this.category});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Results_Screen(resultName: category),));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConstantsColor.materialButtonColor,
      ),
      child: Text(
        category,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
