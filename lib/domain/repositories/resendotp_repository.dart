import 'dart:developer';
import 'package:dio/dio.dart';
import '../core/api_endpoints/api_endpoints.dart';

class ResendOtpRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<String?> resendOTP(String mobile) async {
    try {
      final response = await _dio.post(
          "${ApiEndPoints.organizationId}/${ApiEndPoints.projectId}/${ApiEndPoints.appVersion}/${ApiEndPoints.resendOTP}",
          data: {"mobile": mobile, "type": "text"});
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
