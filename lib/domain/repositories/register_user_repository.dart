import 'dart:developer';
import 'package:dio/dio.dart';
import '../core/api_endpoints/api_endpoints.dart';
import '../models/registerUser/register_user_model.dart';

class RegisterUserRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<String?> registerUser(RegisterUserModel registerUser) async {
    try {
      final response = await _dio.post(
          "${ApiEndPoints.organizationId}/${ApiEndPoints.projectId}/${ApiEndPoints.appVersion}/${ApiEndPoints.registerUserDetails}",
          data: registerUser.toJson());
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
