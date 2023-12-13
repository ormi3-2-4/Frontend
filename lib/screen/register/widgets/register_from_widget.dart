import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:ormi2_4/common/buildcontext_utils.dart';
import 'package:ormi2_4/screen/main/main_screen.dart';
import 'package:ormi2_4/service/user_service.dart';

class RegisterFormWidget extends HookWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();

    final nicknameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final password2Controller = useTextEditingController();
    final formKey = GlobalKey<FormState>();
    final userService = UserService.instance;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const Align(alignment: Alignment.centerLeft, child: Text("이메일")),
            TextFormField(
              controller: emailController,
              validator: (value) {
                final reg =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                if (!reg.hasMatch(value!)) {
                  return "이메일 형식이 맞지 않습니다.";
                }
                return null;
              },
            ),
            const Align(alignment: Alignment.centerLeft, child: Text("닉네임")),
            TextFormField(controller: nicknameController),
            const Align(alignment: Alignment.centerLeft, child: Text("비밀번호")),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "비밀번호를 입력해주세요";
                }
                return null;
              },
            ),
            const Align(alignment: Alignment.centerLeft, child: Text("비밀번호 확인")),
            TextFormField(
              controller: password2Controller,
              obscureText: true,
              validator: (value) {
                if (value != passwordController.text || value!.isEmpty) {
                  return "비밀번호가 맞지 않습니다.";
                }
                return null;
              },
            ),
            SizedBox(height: 30.h),
            SizedBox(
              width: context.screenWidth * 0.7,
              height: 40.h,
              child: Obx(
                () {
                  if (userService.isLogin) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      context.go(MainScreen.routePath);
                    });
                  }
                  return ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        //TODO: 회원가입
                        await userService.register(
                          emailController.text,
                          nicknameController.text,
                          passwordController.text,
                        );
                      }
                    },
                    child: const Text("회원 가입하기"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
