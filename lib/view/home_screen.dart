import 'package:flutter/material.dart';
import 'package:real_app/utils/styles.dart';

class HomeScreen extends StatelessWidget {
  final mainScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: lightGray,
        body: SafeArea(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 24),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            controller: mainScrollController,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1.5,
                  child: GridView.builder(
                    controller: mainScrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: MediaQuery.of(context).size.width > 375
                          ? null
                          : MediaQuery.of(context).size.height / 4.2,
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 375 ? 2 : 1,
                      mainAxisSpacing: 0, //10,
                      crossAxisSpacing: 0, //15,

                      // width / height: fixed for *all* items
                      childAspectRatio: 0.95, // 0.25,
                    ),
                    shrinkWrap: true,
                    itemCount: 12,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(20),
                        height: 30,
                        width: 30,
                        child: Image.network(
                          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                          fit: BoxFit.cover,
                        ),
                        color: Colors.red,
                      );
                    },
                  ),
                ),
                Padding(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: darkBlue,
                    ),
                    padding: EdgeInsets.only())
              ],
            ),
          ),
        ));
  }
}
