import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:real_app/core/models/user.dart';
import 'package:real_app/utils/constants.dart';

class AuthProvider extends ChangeNotifier {
  User? _authenticatedUser;
  bool _isLoading = false;

  User get user {
    return _authenticatedUser!;
  }

  bool get isLoading {
    return _isLoading;
  }

  Future<String> signUp(
      {required String email, required String password}) async {
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
      {required String email, required String password}) async {
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
      String? status = decodedResponse["status"].toString();
      Map<String, dynamic>? data = decodedResponse["data"];
      String? message = decodedResponse["message"].toString();

      if (status == "success" || data != null) {
        debugPrint("LOGIN SUCCESSFUL");
        _isLoading = false;
        notifyListeners();
        return "success";
      } else if (status == "error" || data == null) {
        debugPrint("login FAILED");
        _isLoading = false;
        notifyListeners();
        return message;
      } else {
        debugPrint("SOMETHING FAILED");
        _isLoading = false;
        notifyListeners();
        return "an unknown error has occured";
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
