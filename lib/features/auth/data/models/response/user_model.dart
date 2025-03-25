class UserModel {

  String? userId;
  String? email;
  String? name;
  bool? onlineStatus;
  String? deviceToken;

  UserModel({
    this.userId,
    this.email,
    this.name,
    this.onlineStatus,
    this.deviceToken,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    name = json['name'];
    onlineStatus = json['onlineStatus'];
    deviceToken = json['deviceToken'];
  }

}
