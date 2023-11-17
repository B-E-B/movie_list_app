import 'package:movie_list_app/common/enum/error_auth_type.dart';

class DataResponseModel {
  final bool isSuccess;
  final ErrorAuthType? errorType;

  DataResponseModel({required this.isSuccess, this.errorType});
}
