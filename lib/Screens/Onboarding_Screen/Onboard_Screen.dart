import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:magic_bricks/Screens/Login_Screen/Login_Screen.dart';
import 'package:magic_bricks/Widgets/MainNavigator.dart';

class Onboarding_Screen extends StatefulWidget {
  const Onboarding_Screen({super.key});

  @override
  State<Onboarding_Screen> createState() => _Onboarding_ScreenState();
}

class _Onboarding_ScreenState extends State<Onboarding_Screen> {
  List<String> lines = [
    'Transparency between Buyers and Sellers',
    'Easy to use',
    'Fast and Reliable'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConcentricPageView(
      nextButtonBuilder: (context) {
        return const Center(
          child: Icon(
            Icons.arrow_forward,
            size: 30,
          ),
        );
      },
      onFinish: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Login_Screen(),
            ),
            (route) => false);
      },

      itemCount: 3,
      radius: 30,
      verticalPosition: 0.85,
      colors: <Color>[
        Colors.white,
        Colors.deepPurpleAccent,
        Colors.blueAccent,
      ], // null = infinity
      itemBuilder: (int index) {
        return Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Flexible(
                    flex: 20,
                    child: Image.asset(
                      'assets/images/image$index.png',
                      height: 400,
                      width: 400,
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    lines[index],
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(
                    flex: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
