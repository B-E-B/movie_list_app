import 'package:injectable/injectable.dart';
import 'package:movie_list_app/data/auth/datasource/auth_datasource.dart';
import 'package:movie_list_app/data/auth/model/data_response_model.dart';
import 'package:movie_list_app/domain/auth/entity/user_entity.dart';
import 'package:movie_list_app/domain/auth/repository/auth_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl(this._authDataSource);

  @override
  Future<DataResponseModel> logIn(UserEntity userEntity) async {
    DataResponseModel response = await _authDataSource.logIn(userEntity);
    return response;
  }

  @override
  Future<DataResponseModel> signUp(UserEntity userEntity) async {
    DataResponseModel response = await _authDataSource.signUp(userEntity);
    return response;
  }
}
