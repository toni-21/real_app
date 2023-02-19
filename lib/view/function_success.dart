import 'package:flutter/material.dart';
import 'package:real_app/utils/styles.dart';

class FunctionSuccess extends StatelessWidget {
  final String title;
  final String? message;
  final Widget destination;
  final Widget? additional;
  const FunctionSuccess(
      {Key? key,
      required this.title,
      required this.destination,
      this.message,
      this.additional})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 230,
              width: 250,
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/Thumbs Up.png")),
              ),
            ),
            SizedBox(height: 60),
            Text(
              title,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: darkBlue,
              ),
            ),
            SizedBox(height: 15),
            Flexible(
              child: Text(
                message ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: midBlue,
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => destination,
                    ),
                  );
                },
                child: Text("Continue"),
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
            additional ?? Container(),
          ],
        ),
      ),
    );
  }
}
