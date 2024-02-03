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
          SizedBox(
            height: 40, // Set the height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  4, // Adjust the count based on the number of categories
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CategoryButton(
                    category: getCategoryName(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String getCategoryName(int index) {
    switch (index) {
      case 0:
        return 'Sell';
      case 1:
        return 'Rent';
      case 2:
        return 'Residential';
      case 3:
        return 'Commercial';
      default:
        return '';
    }
  }
}
