import "package:flutter/material.dart";
import "package:social_bird/router/app_router.dart";
import "package:social_bird/view_models/login_view_model.dart";

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final vm = LoginViewModel();
  static final _emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

  void _login() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    vm
      ..setEmail(_emailController.text.trim())
      ..setPassword(_passwordController.text);

    if (!vm.login()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nieprawidłowy e-mail lub hasło')),
      );
      return;
    }

    appRouter.go('/home');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    final email = value?.trim() ?? '';
                    if (email.isEmpty) {
                      return 'Podaj adres e-mail';
                    }
                    if (!_emailRegex.hasMatch(email)) {
                      return 'Podaj prawidłowy adres e-mail';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if ((value ?? '').length < 6) {
                      return 'Hasło musi mieć co najmniej 6 znaków';
                    }
                    return null;
                  },
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
        ),
      ),
    );
  }
}
