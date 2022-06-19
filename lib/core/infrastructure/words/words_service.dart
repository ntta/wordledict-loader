import 'package:dio/dio.dart';
import 'package:sembast/sembast.dart';
import 'package:wordledict_loader/core/infrastructure/database/sembast_database.dart';
import 'package:wordledict_loader/core/infrastructure/network/dio_extensions.dart';
import 'package:wordledict_loader/core/infrastructure/network/rest_api_exception.dart';
import 'package:wordledict_loader/core/infrastructure/settings/settings_repository.dart';
import 'package:wordledict_loader/core/infrastructure/words/word_dto.dart';
import 'package:wordledict_loader/locator.dart';

class WordsService {
  final SembastDatabase _sembastDatabase;
  final Dio _dio;
  final _store = stringMapStoreFactory.store('words');

  WordsService(this._sembastDatabase, this._dio);

  Future<void> insertWord(WordDto wordDto) => _store
      .record(wordDto.id)
      .put(_sembastDatabase.instance, wordDto.toJson());

  Future<void> insertPlainWord(String plainWord) => _store
      .record(plainWord)
      .put(_sembastDatabase.instance, {'id': plainWord});

  Future<void> insertPlainWords(List<String> plainWords) =>
      _store.records(plainWords).put(
            _sembastDatabase.instance,
            plainWords.map((rawWord) => {'id': rawWord}).toList(),
          );

  Future<List<WordDto>> getWords() =>
      _store.find(_sembastDatabase.instance).then(
            (records) => records.map((e) => WordDto.fromJson(e.value)).toList(),
          );

  Future<List<WordDto>> getUncheckedWords() => _store
      .find(
        _sembastDatabase.instance,
        finder: Finder(
          filter: Filter.equals('isChecked', false),
        ),
      )
      .then(
        (records) => records.map((e) => WordDto.fromJson(e.value)).toList(),
      );

  Future<WordDto> getWordFromDictionaryApi(
    WordDto wordDto,
  ) async {
    final plainWord = wordDto.id;
    final dictionaryApiKey =
        locator<SettingsRepository>().dictionaryApiKey ?? '';
    final requestUri = Uri.parse('https://www.dictionaryapi.com').replace(
      path: 'api/v3/references/learners/json/$plainWord',
      queryParameters: {'key': dictionaryApiKey},
    );
    try {
      final response = await _dio.getUri(requestUri);
      if (response.data ==
              'Invalid API key. Not subscribed for this reference.' ||
          response.data == 'Key is required.') {
        throw RestApiException(401);
      }

      final dataList = response.data as List<dynamic>;
      final Map<String, List<String>> meanings = {};
      String? origin;
      for (final element in dataList) {
        if (element is String) {
          // Once the element is string, it means that no meaning found for this word
          break;
        }
        if (element['hom'] != null) {
          // If 'hom' exists, it is origin word
          origin = element['hwi']['hw'];
          final key = element['meta']['app-shortdef']['fl']; // noun, verb, etc.
          final value = element['meta']['app-shortdef']['def'];
          meanings[key] = value;
        }
      }

      final newWordDto = WordDto(
        id: plainWord,
        isChecked: true,
        origin: origin,
        meanings: meanings.isNotEmpty ? meanings : null,
      );

      // Save to database
      await insertWord(newWordDto);

      return newWordDto;
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw RestApiException(503);
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
