import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fathima/domain/models/authorization/authorization.dart';
import '../core/api_endpoints/api_endpoints.dart';

class VerityOtpRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<AuthorizationModel?> verifyOTP(String mobile, int otp) async {
    try {
      final response = await _dio.post(
          "${ApiEndPoints.organizationId}/${ApiEndPoints.projectId}/${ApiEndPoints.appVersion}/${ApiEndPoints.verifyOTP}",
          data: {"mobile": mobile, "otp": otp});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthorizationModel.fromJson(response.data);
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log('error => ${e.toString()}');
    }
    return null;
  }
}
