abstract class PreferencesDataSource {
  String getLocale();
  Future<void> setLocale(String locale);
}