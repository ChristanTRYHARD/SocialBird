import 'package:flutter/material.dart';
import 'package:social_bird/router/app_router.dart';

import '../services/user_service.dart';
import '../models/user_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final userService = UserService();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Hasła nie są takie same')));
      return;
    }

    final user = UserModel(
      username: _usernameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );

    if (!userService.register(user)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Konto z tym e-mailem już istnieje')),
      );
      return;
    }

    appRouter.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(),
            Text('Social Bird'),
            Text('Utworz konto'),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                alignLabelWithHint: true,
              ),
            ),
            ElevatedButton(
              onPressed: _register,
              child: const Text('Zarejestruj'),
            ),
            const Text('Masz już konto?'),
            ElevatedButton(
              onPressed: () {
                appRouter.push('/login');
              },
              child: const Text('Zaloguj'),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
