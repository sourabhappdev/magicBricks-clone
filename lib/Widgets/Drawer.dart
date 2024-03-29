import 'package:flutter/material.dart';
import 'package:magic_bricks/Constants/Constants.dart';
import 'package:magic_bricks/Screens/PostAd_Screen/PostAd_Screen.dart';
import '../Screens/Account_Screen/Help_Screen/Help_Screen.dart';
import '../utils/Methods.dart';
import '../Screens/Account_Screen/Profile_Screen/Profile_Screen.dart';
import '../Screens/Account_Screen/YourListed_Screen/YourListed_Screen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppConstantsColor.materialButtonColor,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage("https://img.freepik.com/premium-vector/business-global-economy_24877-41082.jpg"), // Replace with your image asset
                ),
                SizedBox(height: 8,),
                Text(
                  'John Doe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
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
            leading: Icon(Icons.post_add),
            title: Text('POST PROPERTY'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostAd_Screen(),
                ),
              );
              print('PP tapped');
            },
          ),
          ListTile(
            leading: Icon(Icons.home_work),
            title: Text('YOUR LISTINGS'),
            onTap: () {
              // Handle help tile tap
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YourListed_Screen(),
                  ));
              print('Listings tapped');
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('HELP'),
            onTap: () {
              // Handle help tile tap
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Help_Screen(),
                  ));
              print('Help tapped');
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('DELETE ACCOUNT'),
            onTap: () {
              // Handle help tile tap
              showDeleteAccountDialog(context);
              print('DELETE tapped');
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