import 'dart:developer';
import 'package:dio/dio.dart';
import '../core/api_endpoints/api_endpoints.dart';
import '../models/registerUser/register_user_model.dart';

class GetUserDetails {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));
  Future<List<RegisterUserModel>?> getUserDetails() async {
    try {
      final response = await _dio.post(
        "${ApiEndPoints.organizationId}/${ApiEndPoints.projectId}/${ApiEndPoints.appVersion}/${ApiEndPoints.getUserDetails}",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterUserModel.userList(response.data.user);
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log('error => ${e.toString()}');
    }
    return null;
  }
}
