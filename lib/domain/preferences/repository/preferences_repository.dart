abstract class PreferencesRepository {
  Future<String> getLocale();
  Future<void> setLocale(String locale);
}