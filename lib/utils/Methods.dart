import 'package:flutter/material.dart';



void showDeleteAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete Account'),
        content: Text('Are you sure you want to delete your account?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Perform the delete account action
              // (you can replace this with your actual implementation)
              Navigator.of(context).pop(); // Close the dialog
              // Add your logic to delete the account here
              print('Account deleted!');
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('No'),
          ),
        ],
      );
    },
  );
}