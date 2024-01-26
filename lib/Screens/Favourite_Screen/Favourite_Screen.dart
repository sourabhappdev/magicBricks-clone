import 'package:flutter/material.dart';
import 'package:magic_bricks/Components/PropertyCard.dart';
import 'package:magic_bricks/Widgets/CustomAppBar.dart';
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


  PropertyModel property = PropertyModel(name: "ABC", location: "Vaishali Nagar,Jaipur", price: 12, imageUrl: "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvcGVydHl8ZW58MHx8MHx8fDA%3D");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Favorite Properties"),
      body: favoriteProperties.isEmpty
          ? Center(
              child: Text('No favorite properties yet.'),
            )
          : ListView.builder(
              itemCount: favoriteProperties.length,
              itemBuilder: (context, index) {
                return PropertyCard(property: property,
                );
              },
            ),
    );
  }
}



