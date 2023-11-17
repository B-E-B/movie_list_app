// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Enter as guest`
  String get enterAsGuest {
    return Intl.message(
      'Enter as guest',
      name: 'enterAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Enter login information`
  String get enterLoginInformation {
    return Intl.message(
      'Enter login information',
      name: 'enterLoginInformation',
      desc: '',
      args: [],
    );
  }

  /// `Logging in`
  String get loggingIn {
    return Intl.message(
      'Logging in',
      name: 'loggingIn',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get popular {
    return Intl.message(
      'Popular',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Not found`
  String get notFound {
    return Intl.message(
      'Not found',
      name: 'notFound',
      desc: '',
      args: [],
    );
  }

  /// `Enter registration details`
  String get enterRegistrationDetails {
    return Intl.message(
      'Enter registration details',
      name: 'enterRegistrationDetails',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter your password`
  String get reenterYourPassword {
    return Intl.message(
      'Re-enter your password',
      name: 'reenterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter correct Email`
  String get enterCorrectEmail {
    return Intl.message(
      'Enter correct Email',
      name: 'enterCorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters long`
  String get passwordMustBe {
    return Intl.message(
      'Password must be at least 6 characters long',
      name: 'passwordMustBe',
      desc: '',
      args: [],
    );
  }

  /// `Passwords must match`
  String get passwordsMustMatch {
    return Intl.message(
      'Passwords must match',
      name: 'passwordsMustMatch',
      desc: '',
      args: [],
    );
  }

  /// `Registering`
  String get registering {
    return Intl.message(
      'Registering',
      name: 'registering',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get invalidEmailAddress {
    return Intl.message(
      'Invalid email address',
      name: 'invalidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `A user with this email already exists`
  String get userWithThisEmailAlreadyExists {
    return Intl.message(
      'A user with this email already exists',
      name: 'userWithThisEmailAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Wrong email or password`
  String get wrongEmailOrPassword {
    return Intl.message(
      'Wrong email or password',
      name: 'wrongEmailOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
