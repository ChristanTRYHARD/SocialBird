import "package:flutter/material.dart";
import "package:social_bird/router/app_router.dart";
import "package:social_bird/services/user_service.dart";

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final userService = UserService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    final user = userService.login(
      _emailController.text.trim(),
      _passwordController.text,
    );

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nieprawidłowy e-mail lub hasło')),
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
            ElevatedButton(onPressed: _login, child: const Text('Zaloguj')),
            const Text('Nie masz konta?'),
            OutlinedButton(
              onPressed: () {
                appRouter.push('/register');
              },
              child: const Text('Zarejestruj'),
            ),
          ],
        ),
      ),
    );
  }
}
