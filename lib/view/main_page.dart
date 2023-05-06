import 'package:auth_controller/controller/auth_controller.dart';
import 'package:auth_controller/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const String route = "/main";

  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthController>().user;
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (user != null)
                  Text(
                    "${user.username}님 안녕하세요!",
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const CircleAvatar(),
                  title: Text(user!.username),
                  subtitle: Text(user.name),
                ),
                ListTile(
                  title: const Text("로그아웃하기"),
                  leading: const Icon(Icons.logout),
                  onTap: controller.logout,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.curPage.value,
          onTap: controller.onPageTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "My")
          ],
        ),
      ),
    );
  }
}
