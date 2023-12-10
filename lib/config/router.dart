import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ormi2_4/screen/main_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: MainScreen.routePath,
    routes: [
      GoRoute(
        path: MainScreen.routePath,
        builder: (context, state) => const MainScreen(
          title: 'Flutter Demo',
        ),
      )
    ],
  );
}
