import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ormi2_4/common/buildcontext_utils.dart';
import 'package:ormi2_4/screen/register/register_screen.dart';
import 'package:ormi2_4/screen/start/start_screen.dart';

import '../../../service/user_service.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  InputDecoration decoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Color(0xff2196f3),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Color(0xff2196f3),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Color(0xff2196f3),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Color(0xffba1b1b),
        ),
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
              decoration: decoration(),
            ),
            SizedBox(height: 30.h),
            Center(
              child: SizedBox(
                height: 50.h,
                width: context.screenWidth * 0.6,
                child: ElevatedButton(
                    onPressed: () async {
                      final userService = UserService.instance;
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
                onPressed: () => context.push(RegisterScreen.routePath),
                child: const Text("회원가입"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
