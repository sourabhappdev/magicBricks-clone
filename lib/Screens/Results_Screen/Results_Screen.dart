import 'package:flutter/material.dart';
import 'package:magic_bricks/Widgets/AppBar/AppBar.dart';

import '../../Components/PropertyCard.dart';
import '../../Constants/Constants.dart';
import '../../Models/PropertyModel.dart';

class Results_Screen extends StatefulWidget {
  final String resultName;
  const Results_Screen({super.key, required this.resultName});

  @override
  State<Results_Screen> createState() => _Results_ScreenState();
}

class _Results_ScreenState extends State<Results_Screen> {
  List<String> resultProperties = [
    'Property 1',
    'Property 2',
    'Property 3',
  ];
  PropertyModel property = PropertyModel(
      name: "ABC",
      location: "Vaishali Nagar,Jaipur",
      price: 12,
      imageUrl:
      "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvcGVydHl8ZW58MHx8MHx8fDA%3D");



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey,
      appBar: commonAppBar(context),
      body: resultProperties.isEmpty
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
                        widget.resultName,
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
