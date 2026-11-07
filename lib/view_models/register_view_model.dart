import 'package:flutter/material.dart';

import '../services/user_service.dart';
import '../models/user_model.dart';

class RegisterViewModel extends ChangeNotifier {
  final _userService = UserService();

  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  String get username => _username;
  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

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

  void setConfirmPassword(String password) {
    _confirmPassword = password;
    notifyListeners();
  }

  bool register() {
    String username = _username.trim();
    String email = _email.trim();
    String password = _password;

    final user = UserModel(
      username: username,
      email: email,
      password: password,
    );

    return _userService.register(user);
  }
}
