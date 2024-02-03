import 'package:flutter/material.dart';
import 'package:magic_bricks/Screens/Account_Screen/Help_Screen/Help_Screen.dart';
import 'package:magic_bricks/Screens/Account_Screen/Profile_Screen/Profile_Screen.dart';
import 'package:magic_bricks/Screens/Account_Screen/YourListed_Screen/YourListed_Screen.dart';
import 'package:magic_bricks/Widgets/AppBar/AppBar.dart';
import '../../utils/Methods.dart';

class Account_Screen extends StatefulWidget {
  const Account_Screen({super.key});

  @override
  State<Account_Screen> createState() => _Account_ScreenState();
}

class _Account_ScreenState extends State<Account_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context),
      body: SingleChildScrollView(
        child: Column(
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
                print('Logout tapped');
              },
            ),
          ],
        ),
      ),
    );
  }
}
