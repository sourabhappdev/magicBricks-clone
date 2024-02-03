import 'package:flutter/material.dart';
import 'package:magic_bricks/Components/PropertyCard.dart';
import 'package:magic_bricks/Constants/Constants.dart';
import 'package:magic_bricks/Widgets/AppBar/AppBar.dart';
import '../../Models/PropertyModel.dart';

class Favourite_Screen extends StatefulWidget {
  const Favourite_Screen({super.key});

  @override
  State<Favourite_Screen> createState() => _Favourite_ScreenState();
}

class _Favourite_ScreenState extends State<Favourite_Screen> {
  List<String> favoriteProperties = [
    'Property 1',
    'Property 2',
    'Property 3',
  ];

  PropertyModel property = PropertyModel(
    name: "ABC",
    location: "Vaishali Nagar,Jaipur",
    price: 12,
    city: 'Jaipur',
    address: 'Flat 101',
    carpetArea: 2000,
    superArea: 2200,
    category: 'Residential',
    description: '',
    locality: 'Shankar Nagar',
    numberBHK: 4,
    numberFloor: 3,
    numberWashroom: 2,
    propertyForBuySell: 'Sell',
    subCategory: 'House',
    imageUrl:
    "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvcGVydHl8ZW58MHx8MHx8fDA%3D",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: commonAppBar(context),
      body: favoriteProperties.isEmpty
          ? Center(
              child: Text('No favorite properties yet.'),
            )
          : Column(
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Saved Properties",
                              style: TextStyle(
                                  color: AppConstantsColor.materialButtonColor),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppConstantsColor.materialButtonColor,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return PropertyCard(
                        property: property,
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
