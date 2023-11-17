// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "enterAsGuest": MessageLookupByLibrary.simpleMessage("Enter as guest"),
        "enterCorrectEmail":
            MessageLookupByLibrary.simpleMessage("Enter correct Email"),
        "enterLoginInformation":
            MessageLookupByLibrary.simpleMessage("Enter login information"),
        "enterRegistrationDetails":
            MessageLookupByLibrary.simpleMessage("Enter registration details"),
        "favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
        "invalidEmailAddress":
            MessageLookupByLibrary.simpleMessage("Invalid email address"),
        "loggingIn": MessageLookupByLibrary.simpleMessage("Logging in"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "notFound": MessageLookupByLibrary.simpleMessage("Not found"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordMustBe": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 6 characters long"),
        "passwordsMustMatch":
            MessageLookupByLibrary.simpleMessage("Passwords must match"),
        "popular": MessageLookupByLibrary.simpleMessage("Popular"),
        "reenterYourPassword":
            MessageLookupByLibrary.simpleMessage("Re-enter your password"),
        "registering": MessageLookupByLibrary.simpleMessage("Registering"),
        "registration": MessageLookupByLibrary.simpleMessage("Registration"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong"),
        "userWithThisEmailAlreadyExists": MessageLookupByLibrary.simpleMessage(
            "A user with this email already exists"),
        "wrongEmailOrPassword":
            MessageLookupByLibrary.simpleMessage("Wrong email or password")
      };
}
