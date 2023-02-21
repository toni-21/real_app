import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_app/providers/app_provider.dart';
import 'package:real_app/providers/auth_provider.dart';
import 'package:real_app/utils/styles.dart';
import 'package:real_app/view/app_screen.dart';
import 'package:real_app/view/home_screen.dart';
import 'package:real_app/view/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obsecureText = false;
  bool? termsAccepted = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _submitForm(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      _formKey.currentState!.save();
      String response = await Provider.of<AuthProvider>(context, listen: false)
          .signUp(
              email: emailController.text,
              password: passwordController.text,
              name: nameController.text);
      if (response == "success") {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return AppScreen();
            },
          ),
        );
        // ignore: use_build_context_synchronously
        Provider.of<AppProvider>(context, listen: false).goToTab(0);
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Something went wrong"),
            content: Text(response),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  color: Colors.black.withOpacity(0.1),
                  padding: const EdgeInsets.all(10),
                  child: const Text("okay"),
                ),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightBlue,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 50),
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: purple,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Please provide following \ndetails for your new account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: midBlue,
                    ),
                  ),
                  SizedBox(height: 45),
                  SizedBox(
                    child: TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "value must not be empty";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "First Name",
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: deepPurple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email Address",
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: deepPurple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null ||
                            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                .hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: obsecureText,
                      decoration: InputDecoration(
                        hintText: "Password",
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: deepPurple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12.0),
                        suffixIcon: IconButton(
                          icon: obsecureText
                              ? Icon(CupertinoIcons.eye_slash, size: 25)
                              : Icon(CupertinoIcons.eye, size: 25),
                          onPressed: () {
                            setState(() {
                              obsecureText = !obsecureText;
                            });
                          },
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'password must not be empty';
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 54,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _submitForm(context);
                      },
                      child: Text("Sign up with Email Address"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          backgroundColor: darkGreen,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? - ",
                        style: TextStyle(
                          fontSize: 15,
                          color: midBlue,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: midBlue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            Provider.of<AuthProvider>(context, listen: true).isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
