//json, validation, login to feed
//creating user, reading user, updating user, deleting user

import '../models/user_model.dart';

class UserService {
  static final UserService _instance = UserService._internal();

  factory UserService() => _instance;

  UserService._internal();

  final List<UserModel> _users = [];

  UserModel? login(String email, String password) {
    try {
      return _users.firstWhere(
        (user) => user.email == email && user.password == password,
      );
    } catch (_) {
      return null;
    }
  }

  bool register(UserModel user) {
    final exists = _users.any((u) => u.email == user.email);

    if (exists) {
      return false;
    }

    _users.add(user);

    return true;
  }
}
