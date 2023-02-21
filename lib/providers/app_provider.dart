import 'package:flutter/material.dart';
import 'package:real_app/models/post.dart';

class AppProvider extends ChangeNotifier {
  int _selectedTab = 0;
  List<Post> _posts = [];

  int get getSelectedTab => _selectedTab;
  List<Post> get posts => _posts;

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  createPost(
      {required String name,
      required String image,
      required String caption}) async {
    final Post p = Post(name: name, image: image, caption: caption);
    _posts.add(p);
    notifyListeners();
  }
}
