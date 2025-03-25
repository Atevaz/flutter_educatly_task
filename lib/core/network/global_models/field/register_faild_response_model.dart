class FailedResponseModelData {
  List<String?>? userName;
  List<String?>? clientName;
  List<String?>? phone;
  List<String?>? email;
  List<String?>? address;
  List<String?>? password;
  List<String?>? confirmPassword;
  List<String?>? companyCode;
  List<String?>? message;
  List<String?>? otp;

  FailedResponseModelData({
    this.userName,
    this.password,
    this.companyCode,
    this.message,
    this.confirmPassword,
    this.otp,
  });
  FailedResponseModelData.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      final v = json['name'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      userName = arr0;
    }
    if (json['mobile'] != null) {
      final v = json['mobile'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      userName = arr0;
    }
    if (json['email'] != null) {
      final v = json['email'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      userName = arr0;
    }
    if (json['address'] != null) {
      final v = json['address'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      userName = arr0;
    }
    if (json['user_name'] != null) {
      final v = json['user_name'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      userName = arr0;
    }
    if (json['password'] != null) {
      final v = json['password'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      password = arr0;
    }
    if (json['confirm_password'] != null) {
      final v = json['confirm_password'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      confirmPassword = arr0;
    }
    if (json['otp'] != null) {
      final v = json['otp'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      otp = arr0;
    }
    if (json['company_code'] != null) {
      final v = json['company_code'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      companyCode = arr0;
    }
    if (json['message'] != null) {
      final v = json['message'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      message = arr0;
    }
  }
}

class FailedResponseModel {
  bool? status;
  int? code;
  String? message;
  FailedResponseModelData? errors;

  FailedResponseModel({this.status, this.code, this.message, this.errors});
  FailedResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code']?.toInt();
    errors = (json['error'] != null)
        ? FailedResponseModelData.fromJson(json['error'])
        : null;
  }
}
