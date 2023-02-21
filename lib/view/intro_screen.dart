import 'package:flutter/material.dart';
import 'package:real_app/utils/styles.dart';
import 'package:real_app/view/login_screen.dart';
import 'package:real_app/view/signup_screen.dart';

class IntroScreen extends StatelessWidget {
  Widget actionButton(
      {required BuildContext context,
      required String text,
      required Color backgroundColor,
      required Color textColor,
      bool isSignup = true}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (isSignup) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return SignUpScreen();
                },
              ),
            );
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return LoginScreen();
                },
              ),
            );
          }
        },
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          side: BorderSide(color: Colors.black),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightBlue,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 50),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 8),
              Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                scale: 1.75,
              ),
              SizedBox(height: 10),
              Text(
                "Spin Beaz",
                style: TextStyle(
                  color: purple,
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 72),
              actionButton(
                context: context,
                text: "Sign Up",
                backgroundColor: darkGreen,
                textColor: Colors.white,
              ),
              SizedBox(height: 24),
              actionButton(
                context: context,
                text: "Login",
                backgroundColor: lightBlue,
                textColor: darkGreen,
                isSignup: false
              ),
              SizedBox(height: 20),
              Spacer(),
              Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 15,
                  color: darkGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
