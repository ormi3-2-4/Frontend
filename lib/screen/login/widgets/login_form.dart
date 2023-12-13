import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:ormi2_4/common/buildcontext_utils.dart';
import 'package:ormi2_4/screen/register/register_screen.dart';

import '../../../service/user_service.dart';
import '../../main/main_screen.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final userService = UserService.instance;

  String? passwordErrorText = null;

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
      errorText: isPassword ? passwordErrorText : null,
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
            Text("이메일"),
            TextFormField(
              decoration: decoration(),
              validator: validateEmail,
            ),
            SizedBox(height: 30.h),
            Text("비밀번호"),
            TextFormField(
              obscureText: true,
              decoration: decoration(isPassword: true),
            ),
            SizedBox(height: 30.h),
            Center(
              child: SizedBox(
                height: 50.h,
                width: context.screenWidth * 0.6,
                child: Obx(() {
                  if (userService.isLogin) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      context.go(MainScreen.routePath);
                    });
                  }

                  return ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          //TODO: 로그인
                          await userService.login(emailController.text, passwordController.text);
                        }
                      },
                      child: Text("로그인"));
                }),
              ),
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.go(RegisterScreen.routePath),
                child: Text("회원가입"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
