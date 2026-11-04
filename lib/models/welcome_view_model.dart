import 'package:flutter/material.dart';

class WelcomeViewModel extends ChangeNotifier {

  bool _isLoggedIn = false;

  // usefull for showing loading indicator when login is in progress
  bool _isLoading = false;
}
