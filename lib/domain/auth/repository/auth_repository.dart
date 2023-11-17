import 'package:movie_list_app/data/auth/model/data_response_model.dart';
import 'package:movie_list_app/domain/auth/entity/user_entity.dart';

abstract class AuthRepository {
  Future<DataResponseModel> logIn(UserEntity userEntity);
  Future<DataResponseModel> signUp(UserEntity userEntity);
}
