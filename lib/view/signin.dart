import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_app/core/providers/auth_provider.dart';
import 'package:real_app/utils/styles.dart';
import 'package:real_app/view/signup.dart';


class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  bool obsecureText = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm(context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    // } else {
    //   _formKey.currentState!.save();
    //   String response = await Provider.of<AuthProvider>(context, listen: false)
    //       .login(
    //           number: _numberController.text,
    //           password: _passwordController.text);
    //   if (response == "success") {
    //     // ignore: use_build_context_synchronously
    //     Provider.of<AuthProvider>(context, listen: false)
    //         .setNumber(_numberController.text);
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => FunctionSuccess(
    //           title: "Welcome back!",
    //           destination: Home(),
    //         ),
    //       ),
    //     );
    //   } else {
    //     showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //         title: const Text("Something went wrong"),
    //         content: Text(response),
    //         actions: <Widget>[
    //           TextButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: Container(
    //               color: Colors.black.withOpacity(0.1),
    //               padding: const EdgeInsets.all(10),
    //               child: const Text("okay"),
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    "Welcome Back!",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: deepPurple),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Sign in to continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: midBlue,
                    ),
                  ),
                  SizedBox(height: 60),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: _numberController,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        filled: true,
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
                        if (value == null) {
                          return 'Enter a valid phone number';
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: _passwordController,
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
                        if (value == null) {
                          return 'password must not be empty';
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 13,
                          color: midBlue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _submitForm(context);
                      },
                      child: Text("Sign in to My Account"),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          primary: deepPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? - ",
                        style: TextStyle(
                          fontSize: 15,
                          color: midBlue,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: deepPurple,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Provider.of<AuthProvider>(context, listen: true).isLoading
            //     ? Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     : Container(),
          ],
        ),
      ),
    );
  }
}

