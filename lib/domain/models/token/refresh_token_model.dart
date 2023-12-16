class RefreshTockenModel {
  String? accessToken;
  String? refreshToken;
  RefreshTockenModel({required this.accessToken, required this.refreshToken});
  RefreshTockenModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
}
