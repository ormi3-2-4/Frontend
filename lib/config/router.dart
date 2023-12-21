import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ormi2_4/screen/course/course_screen.dart';
import 'package:ormi2_4/screen/course_detail/course_detail_screen.dart';
import 'package:ormi2_4/screen/login/login_screen.dart';
import 'package:ormi2_4/screen/record/record_screen.dart';
import 'package:ormi2_4/screen/record_detail/record_detail_screen.dart';
import 'package:ormi2_4/screen/record_history/record_history_screen.dart';
import 'package:ormi2_4/screen/register/register_screen.dart';

import '../screen/start/start_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = List.generate(5, (index) => GlobalKey<NavigatorState>());

abstract class AppRouter {
  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: LoginScreen.routePath,
    redirect: (context, state) {
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

      // 기록 화면
      GoRoute(
        path: RecordScreen.routePath,
        name: RecordScreen.routeName,
        builder: (context, state) => const RecordScreen(),
      ),

      // 기록 히스토리
      GoRoute(
          path: RecrodHistoryScreen.routhPath,
          name: RecrodHistoryScreen.routeName,
          builder: (context, state) => const RecrodHistoryScreen(),
          routes: [
            GoRoute(
              path: RecordDetailScreen.routePath,
              name: RecordDetailScreen.routeName,
              builder: (context, state) {
                final recordId = int.parse(state.pathParameters['recordId']!);

                return RecordDetailScreen(recordId);
              },
            )
          ]),
      // 추천
      GoRoute(
          path: CourseScreen.routePath,
          name: CourseScreen.routeName,
          builder: (context, state) => const CourseScreen(),
          routes: [
            GoRoute(
              path: CourseDetailScreen.routePath,
              name: CourseDetailScreen.routeName,
              builder: (context, state) =>
                  CourseDetailScreen(int.parse(state.pathParameters['courseId']!)),
            )
          ])
    ],
  );
}
