import 'package:auth_controller/controller/auth_controller.dart';
import 'package:auth_controller/controller/login_controller.dart';
import 'package:auth_controller/controller/main_controller.dart';
import 'package:auth_controller/view/login_page.dart';
import 'package:auth_controller/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(
        () {
          Get.put(
            AuthController(),
          );
          Get.lazyPut(
            () => LoginController(),
            fenix: true,
          );
          Get.lazyPut(
            () => MainController(),
            fenix: true,
          );
        },
      ),
      getPages: [
        GetPage(
          name: LoginPage.route,
          page: () => const LoginPage(),
        ),
        GetPage(
          name: MainPage.route,
          page: () => const MainPage(),
        ),
      ],
      theme: ThemeData(useMaterial3: true),
      home: const LoginPage(),
    );
  }
}
