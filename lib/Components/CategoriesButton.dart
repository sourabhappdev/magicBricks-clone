import 'package:flutter/material.dart';

import '../Constants/Constants.dart';

class CategoryButton extends StatelessWidget {
  final String category;

  CategoryButton({required this.category});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
