import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ormi2_4/common/buildcontext_utils.dart';
import 'package:ormi2_4/screen/register/register_screen.dart';
import 'package:ormi2_4/screen/start/start_screen.dart';

import '../../../service/user_service.dart';

class LoginFormWidget extends HookWidget {
  const LoginFormWidget({super.key});

  InputDecoration decoration({bool isPassword = false}) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.red),
      ),
    );
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email을 입력해주세요';
    }

    final reg = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!reg.hasMatch(value)) {
      return '올바른 Email을 입력해주세요';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = GlobalKey<FormState>();
    final userService = UserService.instance;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("이메일"),
            TextFormField(
              controller: emailController,
              decoration: decoration(),
              validator: validateEmail,
            ),
            SizedBox(height: 30.h),
            const Text("비밀번호"),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: decoration(isPassword: true),
            ),
            SizedBox(height: 30.h),
            Center(
              child: SizedBox(
                height: 50.h,
                width: context.screenWidth * 0.6,
                child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await userService.login(emailController.text, passwordController.text);

                        if (userService.isLogin.value) {
                          context.go(StartScreen.routePath);
                        }
                      }
                    },
                    child: const Text("로그인")),
              ),
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.go(RegisterScreen.routePath),
                child: const Text("회원가입"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
