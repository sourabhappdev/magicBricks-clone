import 'package:flutter/material.dart';
import 'package:magic_bricks/Widgets/AppBar/AppBar.dart';


class Help_Screen extends StatelessWidget {
  const Help_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer Care',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Customer Care Number:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '+1 (555) 123-4567',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Call Timing and Shifts:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Monday to Friday: 9:00 AM - 5:00 PM',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              'Saturday: 10:00 AM - 2:00 PM',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Note: Our customer care team is available during the specified hours. Please feel free to reach out to us for assistance.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
