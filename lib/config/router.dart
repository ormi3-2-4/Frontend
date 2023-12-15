import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ormi2_4/screen/login/login_screen.dart';
import 'package:ormi2_4/screen/register/register_screen.dart';
import 'package:ormi2_4/service/user_service.dart';

import '../screen/google_map.dart';
import '../screen/start/start_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = List.generate(5, (index) => GlobalKey<NavigatorState>());

abstract class AppRouter {
  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: LoginScreen.routePath,
    redirect: (context, state) {
      if (!UserService.instance.isLogin) {
        return LoginScreen.routePath;
      }

      return null;
    },
    routes: [
      // 로그인
      GoRoute(
          path: LoginScreen.routePath,
          name: LoginScreen.routeName,
          builder: (context, state) => const LoginScreen()),

      // 회원가입
      GoRoute(
          path: RegisterScreen.routePath,
          name: RegisterScreen.routeName,
          builder: (context, state) => const RegisterScreen()),

      // 시작화면
      GoRoute(
        path: StartScreen.routePath,
        name: StartScreen.routeName,
        builder: (context, state) => const StartScreen(),
      ),

      GoRoute(
        path: '/map',
        name: "google map",
        builder: (context, state) => const GoogleMapWidget(),
      )
    ],
  );
}
