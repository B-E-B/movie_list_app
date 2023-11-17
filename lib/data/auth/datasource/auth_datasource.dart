import 'package:movie_list_app/data/auth/model/data_response_model.dart';
import 'package:movie_list_app/domain/auth/entity/user_entity.dart';

abstract class AuthDataSource {
  Future<DataResponseModel> signUp(UserEntity user);
  Future<DataResponseModel> logIn(UserEntity user);
}
