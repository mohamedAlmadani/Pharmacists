import 'package:ecommerce/models/user.dart';
import 'package:get/get.dart';

class AppGet extends GetxController {
  AppUser appUser;
  var users =<AppUser>[].obs;
  setUserModel(AppUser appUser) {
    this.appUser = appUser;
    update();
  }


}