import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magic_bricks/Widgets/MainNavigator.dart';

import '../../Constants/Constants.dart';

class CreateProfile_Screen extends StatefulWidget {
  const CreateProfile_Screen({super.key});

  @override
  State<CreateProfile_Screen> createState() => _CreateProfile_ScreenState();
}

class _CreateProfile_ScreenState extends State<CreateProfile_Screen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  bool _isButtonDisabled = false;
  int _timerSeconds = 60;
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerSeconds > 0) {
          _timerSeconds--;
        } else {
          _timer?.cancel();
          _isButtonDisabled = false;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    late String _email;
    late String _name;
    late String _mobile;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Enter Your Details",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    _name = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Name',
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    _email = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        controller: _mobileController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _mobile = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Icon(Icons.phone),
                          hintText: 'Mobile Number',
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _isButtonDisabled
                        ? null
                        : () {
                      // Handle button press (send OTP)
                      setState(() {
                        _isButtonDisabled = true;
                        _timerSeconds = 60;
                      });
                      startTimer();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppConstantsColor.materialButtonColor,
                      elevation: 5,
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: _isButtonDisabled
                        ? Text('$_timerSeconds seconds')
                        : Text('Send OTP'),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),


              SizedBox(
                height: height * 0.04,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppConstantsColor.materialButtonColor,
                  elevation: 5,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  _email = _emailController.text;
                  _name = _nameController.text;
                  _mobile = _mobileController.text;
                  print('name: $_name');
                  print('Email: $_mobile');
                  print('Email: $_email');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainNavigator(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
