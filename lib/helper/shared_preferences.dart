import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static String loggedInSharedPreferenceKey = 'LOGINKEY';
  static String nameSharedPreferenceKey = 'NAMEKEY';
  static String emailSharedPreferenceKey = 'EMAILKEY';
  static String imgSharedPreferenceKey = 'IMGKEY';

  // ----------------SET METHODS---------------- //
  static Future<void> saveLoggedInSharedPreference(bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(loggedInSharedPreferenceKey, isUserLoggedIn);
  }

  static Future<void> saveNameSharedPreference(String fullname) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nameSharedPreferenceKey, fullname);
  }

  static Future<void> saveEmailSharedPreference(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(emailSharedPreferenceKey, email);
  }

  static Future<void> saveImgSharedPreference(String imagePath) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nameSharedPreferenceKey, imagePath);
  }


  // ----------------GET METHODS---------------- //
  static Future<bool> getUserLoggedInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(loggedInSharedPreferenceKey);
  }

  static Future<String> getNameInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(nameSharedPreferenceKey);
  }

  static Future<String> getImgInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(imgSharedPreferenceKey);
  }

  static Future<String> getEmailInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(emailSharedPreferenceKey);
  }

}