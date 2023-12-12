import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ormi2_4/screen/login/login_screen.dart';
import 'package:ormi2_4/screen/main/main_screen.dart';

import '../screen/google_map.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: LoginScreen.routePath,
    routes: [
      GoRoute(
          path: LoginScreen.routePath,
          name: LoginScreen.routeName,
          builder: (context, state) => const LoginScreen()),
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
