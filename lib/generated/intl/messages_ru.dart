// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "email": MessageLookupByLibrary.simpleMessage("Логин"),
        "enterAsGuest": MessageLookupByLibrary.simpleMessage("Войти как гость"),
        "enterCorrectEmail":
            MessageLookupByLibrary.simpleMessage("Введите корректный Email"),
        "enterLoginInformation":
            MessageLookupByLibrary.simpleMessage("Введите данные для входа"),
        "enterRegistrationDetails": MessageLookupByLibrary.simpleMessage(
            "Введите данные для регистрации"),
        "favorites": MessageLookupByLibrary.simpleMessage("Избранное"),
        "invalidEmailAddress":
            MessageLookupByLibrary.simpleMessage("Недопустимый логин"),
        "loggingIn": MessageLookupByLibrary.simpleMessage("Вход в систему"),
        "login": MessageLookupByLibrary.simpleMessage("Вход"),
        "notFound": MessageLookupByLibrary.simpleMessage("Не найдено"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "passwordMustBe": MessageLookupByLibrary.simpleMessage(
            "Пароль должен состоять минимум из 6 символов"),
        "passwordsMustMatch":
            MessageLookupByLibrary.simpleMessage("Пароли должны совпадать"),
        "popular": MessageLookupByLibrary.simpleMessage("Популярные"),
        "reenterYourPassword":
            MessageLookupByLibrary.simpleMessage("Введите пароль повторно"),
        "registering": MessageLookupByLibrary.simpleMessage("Регистрация"),
        "registration": MessageLookupByLibrary.simpleMessage("Регистрация"),
        "search": MessageLookupByLibrary.simpleMessage("Поиск"),
        "signUp": MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так"),
        "userWithThisEmailAlreadyExists": MessageLookupByLibrary.simpleMessage(
            "Пользователь с данным логином уже существует"),
        "wrongEmailOrPassword":
            MessageLookupByLibrary.simpleMessage("Неверный логин или пароль")
      };
}
