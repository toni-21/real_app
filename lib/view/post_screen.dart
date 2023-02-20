import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_app/providers/app_provider.dart';
import 'package:real_app/utils/styles.dart';

class PostScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostScreenState();
  }
}

class _PostScreenState extends State<PostScreen> {
  final ScrollController mainScrollController = ScrollController();
  bool pictureTaken = true;

  Widget pictureContainer() {
    return Container(
      height: 325,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: lightGray,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              controller: mainScrollController,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0, bottom: 0, top: 0),
                  child: Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                        onPressed: () {
                           Provider.of<AppProvider>(context, listen: false).goToTab(0);
                        },
                        icon: Icon(
                          CupertinoIcons.back,
                          size: 27.5,
                        ),
                        color: Colors.black,
                      ),
                      Text(
                        "Back",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 36),
                Text(
                  "Select Image",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check),
                    Text(
                      "Add Image",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Container(
                  height: 136,
                  decoration: BoxDecoration(
                    color: darkGreen,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  alignment: Alignment.center,
                  child:   Text(
                  "Add Image",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                ),
                SizedBox(height: 27),
                Text(
                  "Write a caption",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.only(top: 6, bottom: 12),
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "Text", border: InputBorder.none),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 120, left: 50, right: 50),
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Create Post",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkGreen,
                    elevation: 0,
                    textStyle: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
