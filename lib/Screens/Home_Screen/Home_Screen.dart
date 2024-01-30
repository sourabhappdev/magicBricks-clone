import 'package:flutter/material.dart';
import 'package:magic_bricks/Components/TopLocalitySection.dart';
import '../../Components/CategorySection.dart';
import '../../Widgets/AppBar/AppBar.dart';
import '../../Components/HomeSlider.dart';
import 'package:magic_bricks/Components/SearchBar.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSearchBar(),
            HomeCarouselSlider(),
            SizedBox(height: 16),
            CategorySection(),
            SizedBox(height: 16),
            TopLocalitySection(),
          ],
        ),
      ),
    );
  }
}
