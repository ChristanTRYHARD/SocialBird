import 'package:flutter/material.dart';
import 'package:social_bird/views/login_view.dart';
void main() {
  runApp(const SocialBirdApp());
}

/// Root Widget
class SocialBirdApp extends StatelessWidget {
  const SocialBirdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Bird',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}