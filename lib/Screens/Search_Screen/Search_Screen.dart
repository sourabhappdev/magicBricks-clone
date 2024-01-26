import 'package:flutter/material.dart';
import 'package:magic_bricks/Constants/Constants.dart';
import 'package:magic_bricks/Widgets/CustomAppBar.dart';
import '../../Components/PropertyCard.dart';
import '../../Models/PropertyModel.dart';

class Search_Screen extends StatefulWidget {
  const Search_Screen({super.key});

  @override
  State<Search_Screen> createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {
  TextEditingController _searchText = TextEditingController();
  String _search = "";
  PropertyModel property = PropertyModel(
      name: "ABC",
      location: "Jaipur",
      price: 12,
      imageUrl:
          "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvcGVydHl8ZW58MHx8MHx8fDA%3D");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Property Search'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _searchText,
              onChanged: (value) {
                setState(() {
                  _search = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                suffix: GestureDetector(
                  onTap: () {
                    print("Reset");
                    setState(() {});
                    _searchText.clear();
                  },
                  child: Text(
                    "Reset",
                    style:
                        TextStyle(color: AppConstantsColor.materialButtonColor),
                  ),
                ),
              ),
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
