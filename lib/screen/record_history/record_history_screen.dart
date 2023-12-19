import 'package:flutter/material.dart';

class RecrodHistoryScreen extends StatelessWidget {
  const RecrodHistoryScreen({super.key});

  static const routhPath = '/record_history';
  static const routeName = 'Recrod History';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Record History"),
      ),
    );
  }
}
