import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_list_app/common/enum/error_auth_type.dart';
import 'package:movie_list_app/common/theme/app_theme.dart';
import 'package:movie_list_app/di/di.dart';
import 'package:movie_list_app/generated/l10n.dart';
import 'package:movie_list_app/presentation/bloc/auth/authorization_screen_bloc.dart';
import 'package:movie_list_app/presentation/screen/auth/signup_screen.dart';
import 'package:movie_list_app/presentation/screen/movie/movie_list_screen.dart';
import 'package:movie_list_app/presentation/widget/authorization_text_field.dart';

class AuthorizationScreen extends StatelessWidget {
  static const routeName = '/authorization';

  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthorizationScreenBloc>(
          create: (_) => getIt<AuthorizationScreenBloc>(),
          dispose: (_, bloc) => bloc.dispose(),
        )
      ],
      child: Consumer<AuthorizationScreenBloc>(builder: (context, authorizationScreenBloc, _) {
        return StreamBuilder<bool>(
            stream: authorizationScreenBloc.isPasswordObscured,
            builder: (context, snapshot) {
              final bool isPasswordObscured = snapshot.data ?? true;
              return StreamBuilder<ErrorAuthType?>(
                  stream: authorizationScreenBloc.errorTypeStream,
                  builder: (context, snapshot) {
                    final ErrorAuthType? errorType = snapshot.data;
                    return Scaffold(
                      body: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 24.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          _loginTitle(context),
                          const SizedBox(height: 12),
                          _enterLoginInformation(context),
                          const SizedBox(height: 40),
                          _emailTextField(authorizationScreenBloc, context),
                          const SizedBox(height: 24),
                          _passwordTextField(authorizationScreenBloc, context, isPasswordObscured),
                          errorType != null ? _errorMessage(context, errorType) : const SizedBox(height: 50),
                          _loginButton(context, authorizationScreenBloc),
                          const SizedBox(height: 16),
                          _signupButton(context, authorizationScreenBloc),
                          const SizedBox(height: 16),
                          _enterAsGuestButton(context)
                        ]),
                      ),
                    );
                  });
            });
      }),
    );
  }

  GestureDetector _enterAsGuestButton(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, MovieListScreen.routeName);
        },
        child: Center(
          child: Text(
            S.of(context).enterAsGuest,
            style: AppTheme.defaults()
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.grey, decoration: TextDecoration.underline),
          ),
        ));
  }

  GestureDetector _signupButton(BuildContext context, AuthorizationScreenBloc authorizationScreenBloc) {
    return GestureDetector(
      onTap: () async {
        final login = await Navigator.pushNamed(context, SignUpScreen.routeName);
        if (login is String) {
          authorizationScreenBloc.insertLogin(login);
        }
      },
      child: Center(
        child: Text(
          S.of(context).signUp,
          style: AppTheme.defaults()
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.grey, decoration: TextDecoration.underline),
        ),
      ),
    );
  }

  GestureDetector _loginButton(BuildContext context, AuthorizationScreenBloc authorizationScreenBloc) {
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
                    Text(S.of(context).loggingIn),
                  ],
                ),
              ),
            );
          },
          barrierDismissible: false,
        );
        await authorizationScreenBloc.logIn().then((response) {
          Navigator.pop(context);
          if (response?.isSuccess ?? false) {
            Navigator.pushReplacementNamed(
              context,
              MovieListScreen.routeName,
            );
          }
        });
      },
      child: Container(
        height: 48.0,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(24)),
        child: Center(
            child: Text(
          S.of(context).login,
          style: AppTheme.defaults().textTheme.bodyLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }

  Center _errorMessage(BuildContext context, ErrorAuthType errorType) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 24),
        child: Text(
          _getErrorMessage(context, errorType),
          style: AppTheme.defaults().textTheme.bodyMedium?.copyWith(color: Colors.red),
        ),
      ),
    );
  }

  AuthorizationTextField _passwordTextField(
      AuthorizationScreenBloc authorizationScreenBloc, BuildContext context, bool isPasswordObscured) {
    return AuthorizationTextField(
      controller: authorizationScreenBloc.passwordController,
      label: S.of(context).password,
      isObscure: isPasswordObscured,
      iconWidget: GestureDetector(
        onTap: authorizationScreenBloc.changePasswordVisibility,
        child: Icon(isPasswordObscured ? Icons.remove_red_eye_outlined : Icons.remove_red_eye),
      ),
    );
  }

  AuthorizationTextField _emailTextField(AuthorizationScreenBloc authorizationScreenBloc, BuildContext context) {
    return AuthorizationTextField(
      controller: authorizationScreenBloc.emailController,
      label: S.of(context).email,
    );
  }

  Text _enterLoginInformation(BuildContext context) {
    return Text(
      S.of(context).enterLoginInformation,
      style: AppTheme.defaults().textTheme.bodyMedium?.copyWith(color: Colors.grey),
    );
  }

  Text _loginTitle(BuildContext context) {
    return Text(
      S.of(context).login,
      style: AppTheme.defaults().textTheme.titleLarge?.copyWith(fontSize: 28, height: 32 / 28),
    );
  }

  String _getErrorMessage(BuildContext context, ErrorAuthType errorType) {
    String errorMessage = '';
    switch (errorType) {
      case ErrorAuthType.wrongLoginOrPassword:
        {
          errorMessage = S.of(context).wrongEmailOrPassword;
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
