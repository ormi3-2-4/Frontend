import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ormi2_4/screen/start/widgets/menu_cards.dart';
import 'package:ormi2_4/screen/start/widgets/start_running_card.dart';
import 'package:ormi2_4/service/user_service.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("런닝 메이트", style: context.textTheme.displayMedium),
                  Obx(() {
                    final user = UserService.instance.user.value!;

                    return CircleAvatar(
                      radius: 35.r,
                      backgroundImage:
                          user.profileImage == null ? null : NetworkImage(user.profileImage!),
                      child: InkWell(
                          borderRadius: BorderRadius.circular(100.r), onTap: () {
                            //TODO: 프로필 화면으로 이동
                          }),
                    );
                  })
                ],
              ),
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
