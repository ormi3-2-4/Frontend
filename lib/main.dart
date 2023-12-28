import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ormi2_4/config/router.dart';
import 'package:ormi2_4/service/dio_service.dart';
import 'package:ormi2_4/service/storage_service.dart';
import 'package:ormi2_4/service/user_service.dart';

import 'config/theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'config.env');

  Logger().d(dotenv.env["MAP_API_KEY"]);

  // GetService 로드
  Get.put(StorageService(), permanent: true);
  Get.put(DioService(), permanent: true);
  Get.put(UserService(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) => child!,
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'Flutter Demo',
        theme: theme,
        builder: (context, child) => child!,
      ),
    );
  }
}
