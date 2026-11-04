import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {

  String _username = '';
  String _email = '';
  final _password = '';

  String get username => _username;
  String get email => _email;
  String get password => _password;

  // usefull for showing loading indicator when login is in progress
  bool isLoading = false;

  String? errorMessage;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }
}
