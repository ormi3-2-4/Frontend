import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ormi2_4/screen/login/login_screen.dart';
import 'package:ormi2_4/screen/main/main_screen.dart';
import 'package:ormi2_4/screen/register/register_screen.dart';

import '../screen/google_map.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: LoginScreen.routePath,
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
      GoRoute(
        path: MainScreen.routePath,
        builder: (context, state) => const MainScreen(
          title: 'Flutter Demo',
        ),
      ),
      GoRoute(
        path: '/map',
        name: "google map",
        builder: (context, state) => const GoogleMapWidget(),
      )
    ],
  );
}
