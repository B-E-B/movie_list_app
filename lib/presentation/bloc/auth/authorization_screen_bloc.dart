import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:movie_list_app/common/enum/error_auth_type.dart';
import 'package:movie_list_app/data/auth/model/data_response_model.dart';
import 'package:movie_list_app/domain/auth/entity/user_entity.dart';
import 'package:movie_list_app/domain/auth/usecase/login_usecase.dart';

@injectable
class AuthorizationScreenBloc {
  final LogInUseCase _logInUseCase;

  final BehaviorSubject<bool> _isPasswordObscured = BehaviorSubject.seeded(true);
  final BehaviorSubject<ErrorAuthType?> _errorTypeSubject = BehaviorSubject();

  final TextEditingController emailController;
  final TextEditingController passwordController;

  Stream<bool> get isPasswordObscured => _isPasswordObscured.stream;
  Stream<ErrorAuthType?> get errorTypeStream => _errorTypeSubject.stream;
  String get email => emailController.text.trim();
  String get password => passwordController.text.trim();

  AuthorizationScreenBloc(this._logInUseCase)
      : emailController = TextEditingController(),
        passwordController = TextEditingController();

  Future<DataResponseModel?> logIn() async {
    UserEntity user = UserEntity(login: email, password: password);

    return await _logInUseCase(user).fold(
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

  void changePasswordVisibility() {
    _isPasswordObscured.add(!_isPasswordObscured.value);
  }

  void insertLogin(String email) {
    emailController.text = email;
    passwordController.text = '';
  }

  void dispose() {
    _isPasswordObscured.close();
    emailController.dispose();
    passwordController.dispose();
    _errorTypeSubject.close();
  }
}
