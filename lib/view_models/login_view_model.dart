import 'package:flutter/material.dart';

import '../services/user_service.dart';

class LoginViewModel extends ChangeNotifier {
  final userService = UserService();

  String _username = '';
  String _email = '';
  String _password = '';

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

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  bool login() {
    final user = userService.login(email, password);

    return user != null;
  }
}
