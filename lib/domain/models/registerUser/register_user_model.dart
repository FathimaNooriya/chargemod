class RegisterUserModel {
  int? mobile;
  String? firstName;
  String? lastName;
  String? email;
  RegisterUserModel(
      {required this.mobile,
      required this.firstName,
      required this.lastName,
      required this.email});
  RegisterUserModel.fromJson(Map<String, dynamic> json) {
    mobile = json["mobile"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    email = json["email"];
  }

  static List<RegisterUserModel> userList(List<dynamic> jsonList) {
    return jsonList.map((e) => RegisterUserModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "mobile": mobile,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
    };
  }
}
