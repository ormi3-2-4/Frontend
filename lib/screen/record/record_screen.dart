import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ormi2_4/screen/record/state/record_state.dart';

class RecordScreen extends HookWidget {
  const RecordScreen({Key? key}) : super(key: key);

  static const routePath = '/record';
  static const routeName = 'RecordScreen';

  @override
  Widget build(BuildContext context) {
    final controller = RecordController.instance;

    print(controller.currentLocation.value);

    return const Scaffold();
  }
}
