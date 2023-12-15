import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ormi2_4/screen/start/widgets/menu_cards.dart';
import 'package:ormi2_4/screen/start/widgets/start_running_card.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  static const routePath = '/start';
  static const routeName = 'StartScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Text("런닝 메이트", style: context.textTheme.displayMedium),
              SizedBox(height: 50.h),
              const StartRunningCardWidget(),
              SizedBox(height: 30.h),
              const MenuCards(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
