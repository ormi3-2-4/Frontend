import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
            ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    //TODO: 로그인
                  }
                },
                child: Text("로그인"))
          ],
        ),
      ),
    );
  }
}
