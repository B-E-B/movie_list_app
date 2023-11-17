import 'package:injectable/injectable.dart';
import 'package:movie_list_app/domain/preferences/usecase/get_locale_usecase.dart';
import 'package:movie_list_app/domain/preferences/usecase/set_locale_usecase.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

@injectable
class LocaleBloc {
  final GetLocaleUseCase _getLocaleUseCase;
  final SetLocaleUseCase _setLocaleUseCase;

  final BehaviorSubject<Locale> _localeSubject = BehaviorSubject.seeded(const Locale('en'));
  Stream<Locale> get localeStream => _localeSubject.stream;

  LocaleBloc(
    this._getLocaleUseCase,
    this._setLocaleUseCase,
  ) {
    _getLocale();
  }

  Future<void> _getLocale() async {
    await _getLocaleUseCase().fold(
      (failure) {},
      (futureLocale) async {
        final String locale = await futureLocale;
        _localeSubject.add(Locale(locale));
      },
    );
  }

  Future<void> setLocale() async {
    final String newLocale = _localeSubject.value == const Locale('en') ? 'ru' : 'en';
    await _setLocaleUseCase(newLocale);
    _getLocale();
    debugPrint('Locale changed to $newLocale');
  }

  void dispose() {
    _localeSubject.close();
  }
}
