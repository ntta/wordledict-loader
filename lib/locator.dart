import 'package:get_it/get_it.dart';
import 'package:wordledict_loader/core/infrastructure/sembast_database.dart';
import 'package:wordledict_loader/core/infrastructure/shared_preferences_database.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  // Initialise databases
  final sembastDatabase = SembastDatabase();
  await sembastDatabase.init();
  locator.registerLazySingleton<SembastDatabase>(() => sembastDatabase);

  final sharedPreferencesDatabase = SharedPreferencesDatabase();
  await sharedPreferencesDatabase.init();
}
