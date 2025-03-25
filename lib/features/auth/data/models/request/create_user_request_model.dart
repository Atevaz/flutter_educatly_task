import 'package:flutter_educatly_task/core/constant/constants.dart';

class CreateUserRequestModel {

  final String? name, email , password , userId;

  final bool onlineStatus;

  CreateUserRequestModel(
      {required this.name,
      required this.email,
      this.userId,
      required this.password,
      required this.onlineStatus});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['userId'] = userId;
    data['deviceToken'] = myDeviceToken;
    data['onlineStatus'] = onlineStatus;
    return data;
  }
}
