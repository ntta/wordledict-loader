import 'package:wordledict_loader/core/infrastructure/database/shared_preferences_database.dart';
import 'package:wordledict_loader/core/infrastructure/settings/setting_enum.dart';

class SettingsRepository {
  final SharedPreferencesDatabase _sharedPreferencesDatabase;

  SettingsRepository(this._sharedPreferencesDatabase);

  Future<void> setDictionaryApiKey(String value) =>
      _sharedPreferencesDatabase.instance
          .setString(Setting.dictionaryApiKey.name, value);

  String? get dictionaryApiKey => _sharedPreferencesDatabase.instance
      .getString(Setting.dictionaryApiKey.name);
}
