import 'package:auth_controller/util/api_routes.dart';
import 'package:auth_controller/view/login_page.dart';
import 'package:auth_controller/view/main_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../model/user.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  Dio dio = Dio();

  User? get user => _user.value;

  login(String id, String pw) async {
    dio.options.baseUrl = "http://52.79.115.43:8090";

    try {
      var res = await dio.post(
        "http://52.79.115.43:8090${ApiRoutes.authWithPassword}",
        data: {'identity': id, 'password': pw},
      );
      if (res.statusCode == 200) {
        var user = User.fromMap(res.data["record"]);
        _user(user);
      }
    } catch (e) {}
  }

  _handleAuthChange(User? data) {
    if (data != null) {
      Get.toNamed(MainPage.route);
      return;
    }
    Get.toNamed(LoginPage.route);
    return;
  }

  logout() {
    _user.value = null;
  }

  @override
  void onInit() {
    super.onInit();

    ever(_user, _handleAuthChange);
  }
}
