import 'package:flutter/material.dart';

import 'CategoriesButton.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              CategoryButton(category: 'Sell'),
              SizedBox(width: 16),
              CategoryButton(category: 'Rent'),
            ],
          ),
        ],
      ),
    );
  }
}
