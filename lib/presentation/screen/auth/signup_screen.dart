import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_list_app/common/enum/error_auth_type.dart';
import 'package:movie_list_app/common/theme/app_theme.dart';
import 'package:movie_list_app/di/di.dart';
import 'package:movie_list_app/generated/l10n.dart';
import 'package:movie_list_app/presentation/bloc/auth/signup_screen_bloc.dart';
import 'package:movie_list_app/presentation/widget/authorization_text_field.dart';
import 'package:email_validator/email_validator.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signup';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<SignUpScreenBloc>(
            create: (_) => getIt<SignUpScreenBloc>(),
            dispose: (_, bloc) => bloc.dispose(),
          )
        ],
        child: Consumer<SignUpScreenBloc>(builder: (context, signUpScreenBloc, _) {
          return StreamBuilder<ErrorAuthType?>(
              stream: signUpScreenBloc.errorTypeStream,
              builder: (context, snapshot) {
                final ErrorAuthType? errorType = snapshot.data;
                return Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      _registrationTitle(context),
                      const SizedBox(height: 12),
                      _enterRegDetails(context),
                      const SizedBox(height: 40),
                      _emailTextField(signUpScreenBloc, context),
                      const SizedBox(height: 24),
                      _passwordTextField(signUpScreenBloc, context),
                      const SizedBox(height: 24),
                      _reEnterPasswordTextfield(signUpScreenBloc, context),
                      errorType != null ? _errorMessage(context, errorType) : const SizedBox(height: 48),
                      _signUpButton(context, signUpScreenBloc),
                      const SizedBox(height: 16),
                      _backToLoginButton(context)
                    ]),
                  ),
                );
              });
        }));
  }

  GestureDetector _backToLoginButton(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Text(
            S.of(context).login,
            style: AppTheme.defaults()
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.grey, decoration: TextDecoration.underline),
          ),
        ));
  }

  GestureDetector _signUpButton(BuildContext context, SignUpScreenBloc signUpScreenBloc) {
    return GestureDetector(
      onTap: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    Text(S.of(context).registering),
                  ],
                ),
              ),
            );
          },
          barrierDismissible: false,
        );
        await signUpScreenBloc.signUp().then((response) {
          Navigator.pop(context);
          if (response?.isSuccess ?? false) {
            Navigator.pop(context, signUpScreenBloc.email);
          } else {}
        });
      },
      child: Container(
        height: 48.0,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(24.0)),
        child: Center(
            child: Text(
          S.of(context).signUp,
          style: AppTheme.defaults().textTheme.bodyLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }

  Center _errorMessage(BuildContext context, ErrorAuthType errorType) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 32),
          Text(
            _getErrorMessage(context, errorType),
            style: AppTheme.defaults().textTheme.bodyMedium?.copyWith(color: Colors.red),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  AuthorizationTextField _reEnterPasswordTextfield(SignUpScreenBloc signUpScreenBloc, BuildContext context) {
    return AuthorizationTextField(
      controller: signUpScreenBloc.repeatPasswordController,
      label: S.of(context).reenterYourPassword,
      isObscure: true,
      validator: (password) =>
          password != null && password != signUpScreenBloc.password ? S.of(context).passwordsMustMatch : null,
    );
  }

  AuthorizationTextField _passwordTextField(SignUpScreenBloc signUpScreenBloc, BuildContext context) {
    return AuthorizationTextField(
      controller: signUpScreenBloc.passwordController,
      label: S.of(context).password,
      isObscure: true,
      validator: (password) => password != null && password.length < 6 ? S.of(context).passwordMustBe : null,
    );
  }

  AuthorizationTextField _emailTextField(SignUpScreenBloc signUpScreenBloc, BuildContext context) {
    return AuthorizationTextField(
      controller: signUpScreenBloc.emailController,
      label: S.of(context).email,
      validator: (email) => email != null && !EmailValidator.validate(email) ? S.of(context).enterCorrectEmail : null,
    );
  }

  Text _enterRegDetails(BuildContext context) {
    return Text(
      S.of(context).enterRegistrationDetails,
      style: AppTheme.defaults().textTheme.bodyMedium?.copyWith(color: Colors.grey),
    );
  }

  Text _registrationTitle(BuildContext context) {
    return Text(
      S.of(context).registration,
      style: AppTheme.defaults().textTheme.titleLarge?.copyWith(fontSize: 28, height: 32 / 28),
    );
  }

  String _getErrorMessage(BuildContext context, ErrorAuthType errorType) {
    String errorMessage = '';
    switch (errorType) {
      case ErrorAuthType.emailAddressIncorrect:
        {
          errorMessage = S.of(context).invalidEmailAddress;
        }
        break;
      case ErrorAuthType.emailAlreadyExist:
        {
          errorMessage = S.of(context).userWithThisEmailAlreadyExists;
        }
        break;

      default:
        {
          errorMessage = S.of(context).somethingWentWrong;
        }
    }
    return errorMessage;
  }
}
