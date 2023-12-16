import 'dart:developer';

import 'package:dio/dio.dart';
import '../../data/services/shared_preference/shared_preference.dart';
import '../core/api_endpoints/api_endpoints.dart';
import '../models/token/refresh_token_model.dart';

class RefreshTocken {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));
  Future<RefreshTockenModel?> refreshToken() async {
    String refreshTocken = await SharedPref.getRefreshToken();
    try {
      final response = await _dio.post(
          "${ApiEndPoints.organizationId}/${ApiEndPoints.projectId}/${ApiEndPoints.appVersion}/${ApiEndPoints.refreshToken}",
          data: {"refreshToken": refreshTocken});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RefreshTockenModel.fromJson(response.data);
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log('error => ${e.toString()}');
    }
    return null;
  }
}
