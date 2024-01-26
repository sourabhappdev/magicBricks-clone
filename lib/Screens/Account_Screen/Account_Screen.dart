import 'package:flutter/material.dart';
import 'package:magic_bricks/Screens/Account_Screen/Profile_Screen.dart';
import 'package:magic_bricks/Screens/Favourite_Screen/Favourite_Screen.dart';
import 'package:magic_bricks/Widgets/CustomAppBar.dart';

class Account_Screen extends StatefulWidget {
  const Account_Screen({super.key});

  @override
  State<Account_Screen> createState() => _Account_ScreenState();
}

class _Account_ScreenState extends State<Account_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Account',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('PROFILE'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile_Screen(),
                ),
              );
              print('Profile tapped');
            },
          ),
          ListTile(
            leading: Icon(Icons.home_work),
            title: Text('YOUR LISTINGS'),
            onTap: () {
              // Handle help tile tap
              print('Listings tapped');
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('FAVOURITES'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Favourite_Screen(),
                ),
              );
              print('Favourites tapped');
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('HELP'),
            onTap: () {
              // Handle help tile tap
              print('Help tapped');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('LOGOUT'),
            onTap: () {
              // Handle logout tile tap
              print('Logout tapped');
            },
          ),
        ],
      ),
    );
  }
}
