import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDatabase {
  late SharedPreferences _instance;
  SharedPreferences get instance => _instance;

  bool _hasBeenInitialized = false;

  Future<void> init() async {
    if (_hasBeenInitialized) return;
    _instance = await SharedPreferences.getInstance();
    _hasBeenInitialized = true;
  }
}
