import 'package:ecommerce/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  SPHelper._();
  static final SPHelper spHelper = SPHelper._();
  SharedPreferences prefs;
  Future<SharedPreferences> initSharedPreferences() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
    return prefs;
  }

  saveUser(AppUser appUser) {
    prefs.setString('userName', appUser.userName);
    prefs.setString('userId', appUser.userId);
    prefs.setString('userEmail', appUser.email);
  }
AppUser getUser(){
  String userId = prefs.getString('userId');
  String userName = prefs.getString('userName');
  String userEmail = prefs.getString('userEmail');
  if (userId != null)
    return AppUser(email: userEmail, userId: userId, userName: userName);
  return null;

}

  clearData() {
    prefs.clear();
  }

}
