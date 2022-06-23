import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';
import 'package:wordledict_loader/core/infrastructure/database/sembast_database.dart';
import 'package:wordledict_loader/core/infrastructure/database/shared_preferences_database.dart';
import 'package:wordledict_loader/core/infrastructure/settings/settings_repository.dart';
import 'package:wordledict_loader/core/infrastructure/words/words_repository.dart';
import 'package:wordledict_loader/core/infrastructure/words/words_service.dart';
import 'package:wordledict_loader/loader_overview/bloc/loader_overview_bloc.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  locator.registerLazySingleton<Dio>(() => Dio());
  // Initialise databases
  final sembastDatabase = SembastDatabase();
  await sembastDatabase.init();
  locator.registerLazySingleton<SembastDatabase>(() => sembastDatabase);

  // TODO: remove the line below
  // stringMapStoreFactory.store('words').delete(sembastDatabase.instance);

  final sharedPreferencesDatabase = SharedPreferencesDatabase();
  await sharedPreferencesDatabase.init();
  locator.registerLazySingleton<SharedPreferencesDatabase>(
      () => sharedPreferencesDatabase);

  locator.registerLazySingleton<WordsService>(
    () => WordsService(locator<SembastDatabase>(), locator<Dio>()),
  );

  locator.registerLazySingleton<WordsRepository>(
    () => WordsRepository(
      locator<WordsService>(),
    ),
  );
  locator.registerLazySingleton<SettingsRepository>(
    () => SettingsRepository(
      locator<SharedPreferencesDatabase>(),
    ),
  );

  locator.registerLazySingleton<LoaderOverviewBloc>(
    () => LoaderOverviewBloc(
      locator<WordsRepository>(),
    ),
  );
}
