import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:magic_bricks/Constants/Constants.dart';
import 'package:magic_bricks/Screens/Search_Screen/Search_Screen.dart';
import 'package:magic_bricks/Widgets/Drawer.dart';
import '../../Widgets/AppBar/AppBar.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SearchBar(),
            CarouselSliderSection(),
            CategoriesSection(),
            OtherSections(),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
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

class CarouselSliderSection extends StatelessWidget {
  final List<String> offers = [
    'Offer 1',
    'Offer 2',
    'Offer 3',
    // Add more offers
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: offers.map((offer) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Center(
                child: Text(
                  offer,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Categories',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryButton('Buy'),
              CategoryButton('Sell'),
              CategoryButton('Rent'),
              CategoryButton('PG'),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String category;

  CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle category button press
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

class OtherSections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionTitle('Trending Properties'),
          // Add content for Trending Properties section
          SizedBox(height: 20.0),
          SectionTitle('Newly Added'),
          // Add content for Newly Added section
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    );
  }
}
