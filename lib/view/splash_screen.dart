import 'dart:async';
import 'package:flutter/material.dart';
import 'package:real_app/utils/styles.dart';
import 'package:real_app/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    setVisibility();
    Timer(
      Duration(milliseconds: 3600),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      ),
    );
  }

  void setVisibility() {
    Timer(
      Duration(seconds: 1),
      (() {
        setState(() {
          visible = true;
        });
      }),
    );
  }

  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
        color: lightBlue,
        child: AnimatedOpacity(
          curve: Curves.easeInOut,
          opacity: visible ? 1.0 : 0.2,
          duration: Duration(milliseconds: 2000),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                  scale: 2.0,
                )
              ],
            ),
          ),
        ),),
      ),
    );
  }
}
