import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:movie_list_app/common/enum/error_auth_type.dart';
import 'package:movie_list_app/data/auth/model/data_response_model.dart';
import 'package:movie_list_app/domain/auth/entity/user_entity.dart';
import 'package:movie_list_app/domain/auth/usecase/signup_usecase.dart';

@injectable
class SignUpScreenBloc {
  final SignUpUseCase _signUpUseCase;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController repeatPasswordController;

  final BehaviorSubject<ErrorAuthType?> _errorTypeSubject = BehaviorSubject();

  Stream<ErrorAuthType?> get errorTypeStream => _errorTypeSubject.stream;
  String get email => emailController.text.trim();
  String get password => passwordController.text.trim();
  String get repeatPassword => repeatPasswordController.text.trim();

  SignUpScreenBloc(this._signUpUseCase)
      : emailController = TextEditingController(),
        passwordController = TextEditingController(),
        repeatPasswordController = TextEditingController();

  Future<DataResponseModel?> signUp() async {
    if (password == repeatPassword && password.length >= 6 && EmailValidator.validate(email)) {
      UserEntity user = UserEntity(login: email, password: password);

      return await _signUpUseCase(user).fold(
        (failure) {
          return null;
        },
        (response) async {
          final dataResponse = await response;
          _errorTypeSubject.add(dataResponse.errorType);
          return dataResponse;
        },
      );
    }
    return null;
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    _errorTypeSubject.close();
  }
}
