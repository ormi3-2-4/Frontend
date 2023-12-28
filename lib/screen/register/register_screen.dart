import 'package:flutter/material.dart';
import 'package:ormi2_4/common/buildcontext_utils.dart';
import 'package:ormi2_4/screen/register/widgets/register_from_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const routePath = '/register';
  static const routeName = 'RegisterScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("회원가입", style: context.textTheme.displayLarge),
            const RegisterFormWidget(),
          ],
        ),
      ),
    );
  }
}
