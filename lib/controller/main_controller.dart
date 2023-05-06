import 'package:auth_controller/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var pageController = PageController();
  RxInt curPage = 0.obs;

  onPageTapped(int page) {
    pageController.jumpToPage(page);
    curPage(page);
  }

  logout() {
    Get.find<AuthController>().logout();
  }
}
