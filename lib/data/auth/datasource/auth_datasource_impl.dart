import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_list_app/common/enum/error_auth_type.dart';
import 'package:movie_list_app/data/auth/datasource/auth_datasource.dart';
import 'package:movie_list_app/data/auth/model/data_response_model.dart';
import 'package:movie_list_app/domain/auth/entity/user_entity.dart';

@Singleton(as: AuthDataSource)
class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<DataResponseModel> logIn(UserEntity user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.login,
        password: user.password,
      );
      return DataResponseModel(isSuccess: true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return DataResponseModel(isSuccess: false, errorType: ErrorAuthType.wrongLoginOrPassword);
      } else {
        return DataResponseModel(isSuccess: false, errorType: ErrorAuthType.errorGeneric);
      }
    }
  }

  @override
  Future<DataResponseModel> signUp(UserEntity user) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.login,
        password: user.password,
      );
      return DataResponseModel(isSuccess: true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'The email address is badly formatted') {
        return DataResponseModel(isSuccess: false, errorType: ErrorAuthType.emailAddressIncorrect);
      } else if (e.code == 'email-already-in-use') {
        return DataResponseModel(isSuccess: false, errorType: ErrorAuthType.emailAlreadyExist);
      }
      return DataResponseModel(isSuccess: false, errorType: ErrorAuthType.errorGeneric);
    }
  }
}
