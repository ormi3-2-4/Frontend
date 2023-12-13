import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  static const routePath = '/start';
  static const routeName = 'StartScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Column()),
    );
  }
}
