import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_app/providers/app_provider.dart';
import 'package:real_app/view/home_screen.dart';
import 'package:real_app/view/post_screen.dart';

class AppScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppScreenState();
  }
}

class _AppScreenState extends State<AppScreen> {
  static List<Widget> pages = <Widget>[
    HomeScreen(),
    PostScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: IndexedStack(
        index: Provider.of<AppProvider>(context, listen: true).getSelectedTab,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          Provider.of<AppProvider>(context, listen: false).goToTab(index);
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex:
            Provider.of<AppProvider>(context, listen: true).getSelectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.music_note_2),
            label: "Post",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore_rounded),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
