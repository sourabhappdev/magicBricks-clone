import 'package:flutter/material.dart';
import 'package:magic_bricks/Constants/Constants.dart';
import 'package:magic_bricks/Widgets/AppBar/AppBar.dart';

class Notification_Screen extends StatefulWidget {
  const Notification_Screen({super.key});

  @override
  State<Notification_Screen> createState() => _Notification_ScreenState();
}

class _Notification_ScreenState extends State<Notification_Screen> {
  final List<String> notifications = [
    'New message from Agent A regarding Property X.',
    'Your property listing has been approved.',
    'Reminder: Upcoming property visit scheduled.',
    'New message from Agent A regarding Property X.',
    'Your property listing has been approved.',
    'Reminder: Upcoming property visit scheduled.',
    'New message from Agent A regarding Property X.',
    'Your property listing has been approved.',
    'Reminder: Upcoming property visit scheduled.',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppConstantsColor.materialButtonColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Unread Notifications ${notifications.length}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Icon(
                    Icons.notifications,
                    size: 32,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amber,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: ListTile(
                    trailing: ElevatedButton(
                      onPressed: () {
                        print("Remove Notifivation");
                      },
                      child: Text(
                        'Mark as Unread',
                        style: TextStyle(
                          color: AppConstantsColor.materialButtonColor,
                        ),
                      ),
                    ),
                    title: Text(
                      notifications[index],
                      style: TextStyle(color: Colors.black),
                    ),
                    // Add onTap or other interaction logic here
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
