import 'dart:developer';
import 'package:dio/dio.dart';
import '../core/api_endpoints/api_endpoints.dart';

class SigninRepasitory {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<String?> signIn(String mobile) async {
    try {
      final response = await _dio.post(
          "${ApiEndPoints.organizationId}/${ApiEndPoints.projectId}/${ApiEndPoints.appVersion}/${ApiEndPoints.signIn}",
          data: {"mobile": mobile});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return "Success";
      } else {
        return response.statusCode.toString();
      }
    } catch (e) {
      log('error => ${e.toString()}');
    }
    return null;
  }
}
