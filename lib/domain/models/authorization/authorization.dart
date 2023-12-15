class AuthorizationModel {
  String? accessToken;
  String? refreshToken;
  bool? isNewUser;
  String? userId;
  AuthorizationModel(
      {required this.accessToken,
      required this.refreshToken,
      required this.isNewUser,
      required this.userId});

  AuthorizationModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    isNewUser = json['isNewUser'];
    userId = json['userId'];
  }
}
