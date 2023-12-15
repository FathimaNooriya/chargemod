import 'package:fathima/domain/models/authorization/authorization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String accessKey = 'access_key';
  static const String refreshKey = 'refresh_key';
  static const String isNewUser = 'isNewUser';
  static const String userId = 'userId';

  static Future<void> setAuthorization(
      {required AuthorizationModel authorizationModel}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(accessKey, authorizationModel.accessToken!);
    preferences.setString(refreshKey, authorizationModel.refreshToken!);
    preferences.setBool(isNewUser, authorizationModel.isNewUser!);
    preferences.setString(userId, authorizationModel.userId!);
  }

  static Future<bool> newUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(isNewUser) ?? false;
  }

  static Future<void> setAccessToken({required String accessToken}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(accessKey, accessToken);
  }

  static Future<String> getAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String accessToken = preferences.getString(accessKey) ?? '';
    return accessToken;
  }

  static Future<String> getRefreshToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String refreshToken = preferences.getString(refreshKey) ?? '';
    return refreshToken;
  }
}
