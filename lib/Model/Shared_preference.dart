import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences preferences;
  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveEmail(String email) async {
    await preferences.setString('email', email);
  }

  static String? getEmail(String email) {
    return preferences.getString('email');
  }

  static Future<void> savePass(String pass) async {
    await preferences.setString('password', pass);
  }
}
