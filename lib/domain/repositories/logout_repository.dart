import 'dart:developer';
import 'package:dio/dio.dart';
import '../../data/services/shared_preference/shared_preference.dart';
import '../core/api_endpoints/api_endpoints.dart';

class LogoutRepasitory {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<String?> signIn() async {
    String refreshTocken = await SharedPref.getRefreshToken();
    try {
      final response = await _dio.post(
          "${ApiEndPoints.organizationId}/${ApiEndPoints.projectId}/${ApiEndPoints.appVersion}/${ApiEndPoints.logout}",
          data: {"refreshToken": refreshTocken});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return "Success";
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log('error => ${e.toString()}');
    }
    return null;
  }
}
