import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_list_app/data/auth/model/data_response_model.dart';
import 'package:movie_list_app/domain/auth/entity/user_entity.dart';
import 'package:movie_list_app/domain/auth/repository/auth_repository.dart';
import 'package:movie_list_app/domain/entity/entity.dart';

@singleton
class SignUpUseCase {
  final AuthRepository _authRepository;

  SignUpUseCase(this._authRepository);

  Either<Failure, Future<DataResponseModel>> call(UserEntity user) {
    try {
      return Right(_authRepository.signUp(user));
    } catch (e, s) {
      return Left(
        Failure(
          exception: e,
          stackTrace: s,
          message: e.toString(),
        ),
      );
    }
  }
}
