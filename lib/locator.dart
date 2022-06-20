import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wordledict_loader/core/infrastructure/database/sembast_database.dart';
import 'package:wordledict_loader/core/infrastructure/database/shared_preferences_database.dart';
import 'package:wordledict_loader/core/infrastructure/words/words_repository.dart';
import 'package:wordledict_loader/core/infrastructure/words/words_service.dart';
import 'package:wordledict_loader/loader/bloc/loader_bloc.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  locator.registerLazySingleton<Dio>(() => Dio());
  // Initialise databases
  final sembastDatabase = SembastDatabase();
  await sembastDatabase.init();
  locator.registerLazySingleton<SembastDatabase>(() => sembastDatabase);

  final sharedPreferencesDatabase = SharedPreferencesDatabase();
  await sharedPreferencesDatabase.init();

  locator.registerLazySingleton<WordsService>(
    () => WordsService(locator<SembastDatabase>(), locator<Dio>()),
  );

  locator.registerLazySingleton<WordsRepository>(
    () => WordsRepository(
      locator<WordsService>(),
    ),
  );

  locator.registerLazySingleton<LoaderBloc>(
    () => LoaderBloc(
      locator<WordsRepository>(),
    ),
  );
}
