import 'package:flutter/material.dart';
import 'package:magic_bricks/Screens/Notification_Screen/Notification_Screen.dart';
import 'package:magic_bricks/Widgets/MainNavigator.dart';
import '../../Constants/Constants.dart';
import '../../Screens/PostAd_Screen/PostAd_Screen.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppConstantsColor.materialButtonColor,
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: () {
        print("working");
        Scaffold.of(context).openDrawer();
      },
      icon: Icon(
        Icons.menu,
        color: Colors.white,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Notification_Screen(),));
        },
        icon: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostAd_Screen(),
                ));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            // elevation: 5,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text('Post Property'),
        ),
      ),
    ],
  );
}

AppBar commonAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppConstantsColor.materialButtonColor,
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainNavigator(),
            ));
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Notification_Screen(),));
        },
        icon: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
      ),
    ],
  );
}
