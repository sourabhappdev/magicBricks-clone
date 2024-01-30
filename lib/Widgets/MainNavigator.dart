import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:magic_bricks/Constants/Constants.dart';
import 'package:magic_bricks/Screens/Favourite_Screen/Favourite_Screen.dart';
import 'package:magic_bricks/Screens/Home_Screen/Home_Screen.dart';
import 'package:magic_bricks/Screens/Search_Screen/Search_Screen.dart';
import 'package:magic_bricks/Screens/Account_Screen/Account_Screen.dart';
import 'package:magic_bricks/Widgets/Drawer.dart';

class MainNavigator extends StatefulWidget {
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {

  PageController _pageController = PageController();

  int _selectedIndex = 0;
  List<Widget> _screen = [
    Home_Screen(),
    Search_Screen(),
    Favourite_Screen(),
    Account_Screen(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          controller: _pageController,
          onPageChanged: (page) {
            setState(() {
              _selectedIndex = page;
            });
          },
          itemBuilder: (context, position) {
            return Container(
              color: Colors.transparent,
              child: _screen[position],
            );
          }),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: GNav(
            tabs: const [
              GButton(
                icon: Icons.home,
                iconColor: AppConstantsColor.materialButtonColor,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                iconColor: AppConstantsColor.materialButtonColor,
                text: 'Search',
              ),
              GButton(
                icon: Icons.favorite,
                iconColor: AppConstantsColor.materialButtonColor,
                text: 'Favourite',
              ),
              GButton(
                icon: Icons.person,
                iconColor: AppConstantsColor.materialButtonColor,
                text: 'Account',
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            backgroundColor: Colors.white,
            gap: 15,
            activeColor: Colors.white,
            tabBackgroundColor: AppConstantsColor.materialButtonColor,
            padding: const EdgeInsets.all(16),
            haptic: true,
            selectedIndex: _selectedIndex,
            onTabChange: (page) {
              setState(() {
                _selectedIndex = page;
              });
              _pageController.jumpToPage(page);
            },
          ),
        ),
      ),
    );
  }
}
