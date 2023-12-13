import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ormi2_4/common/buildcontext_utils.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final emailController = TextEditingController();
  final nicknameController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Align(alignment: Alignment.centerLeft, child: Text("이메일")),
            TextFormField(
              controller: emailController,
              validator: (value) {
                final reg =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                if (!reg.hasMatch(value!)) {
                  return "이메일 형식이 맞지 않습니다.";
                }
              },
            ),
            Align(alignment: Alignment.centerLeft, child: Text("닉네임")),
            TextFormField(controller: nicknameController),
            Align(alignment: Alignment.centerLeft, child: Text("비밀번호")),
            TextFormField(
              controller: passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "비밀번호를 입력해주세요";
                }
              },
            ),
            Align(alignment: Alignment.centerLeft, child: Text("비밀번호 확인")),
            TextFormField(
              controller: password2Controller,
              validator: (value) {
                if (value != passwordController.text || value!.isEmpty) {
                  return "비밀번호가 맞지 않습니다.";
                }
              },
            ),
            SizedBox(height: 30.h),
            SizedBox(
              width: context.screenWidth * 0.7,
              height: 40.h,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    //TODO: 회원가입
                  }
                },
                child: Text("회원 가입하기"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
