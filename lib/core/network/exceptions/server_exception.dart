import '../global_models/field/register_faild_response_model.dart';

class ServerException implements Exception {
  final String arMessage;
  final String enMessage;

  const ServerException({
    required this.enMessage,
    required this.arMessage,
  });
}

class ErrorException implements Exception {
  bool? status;
  int? code;
  String? message;
  FailedResponseModelData? errors;

  ErrorException(
      {this.status, this.code, this.message , this.errors});
  ErrorException.fromJson(Map<String, dynamic> json) {
    print(json);
    status = json['status'];
    code = json['code']?.toInt();
    errors = json['error'] != null ? FailedResponseModelData.fromJson(json['error']): null;
    print(errors);
  }
}
