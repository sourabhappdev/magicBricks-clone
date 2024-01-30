import 'package:flutter/material.dart';
import 'package:magic_bricks/Constants/Constants.dart';
import '../../../Widgets/AppBar/AppBar.dart';

class Profile_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 4), // vertical shadow
                    blurRadius: 4.0, // blur radius
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/premium-vector/business-global-economy_24877-41082.jpg"), // Replace with your image asset
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Xyx Xyz',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Xyz Xyz'),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit),
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('xyz@example.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+123 456 7890'),
            ),
            // Add more profile information as needed
          ],
        ),
      ),
    );
  }
}
