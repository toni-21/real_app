import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:real_app/models/user.dart';
import 'package:real_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  User? _authenticatedUser;
  bool _isLoading = false;

  User get user {
    return _authenticatedUser!;
  }

  bool get isLoading {
    return _isLoading;
  }

  void setAuth({required String email, required String name}) async {
    final prefs = await SharedPreferences.getInstance();
    _authenticatedUser = User(
      name: name,
      email: email,
    );

    prefs.setString('userName', name);
    prefs.setString('userEmail', email);
  }

  Future<String> signUp(
      {required String email,
      required String password,
      required String name}) async {
    debugPrint("$email is email, $password is password, ");
    _isLoading = true;
    notifyListeners();
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
      "returnSecureToken": true,
    };
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
    };
    try {
      final response = await http.post(Uri.parse(AppConfig.signup),
          body: json.encode(body), headers: requestHeaders);
      debugPrint(response.body);
      final decodedResponse = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("SIGNUP SUCCESSFUL");
        setAuth(email: email, name: name);
        _isLoading = false;
        notifyListeners();
        return "success";
      } else {
        debugPrint("SIGNUP FAILED");
        String message = decodedResponse["error"]["message"];
        _isLoading = false;
        notifyListeners();
        return message;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<String> login(
      {required String email,
      required String password,
      required String name}) async {
    debugPrint("$email is email, $password is password, ");
    _isLoading = true;
    notifyListeners();
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
      "returnSecureToken": true,
    };
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
    };
    try {
      final response = await http.post(Uri.parse(AppConfig.login),
          body: json.encode(body), headers: requestHeaders);
      debugPrint(response.body);
      final decodedResponse = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("LOGIN SUCCESSFUL");
        setAuth(email: email, name: name);
        _isLoading = false;
        notifyListeners();
        return "success";
      } else {
        debugPrint("LOGIN FAILED");
        String message = decodedResponse["error"]["message"];
        _isLoading = false;
        notifyListeners();
        return message;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
