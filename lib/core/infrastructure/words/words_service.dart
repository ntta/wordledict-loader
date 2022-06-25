import 'package:dio/dio.dart';
import 'package:sembast/sembast.dart';
import 'package:wordledict_loader/core/infrastructure/database/sembast_database.dart';
import 'package:wordledict_loader/core/infrastructure/network/dio_extensions.dart';
import 'package:wordledict_loader/core/infrastructure/network/rest_api_exception.dart';
import 'package:wordledict_loader/core/infrastructure/settings/settings_repository.dart';
import 'package:wordledict_loader/core/infrastructure/words/word_dto.dart';
import 'package:wordledict_loader/core/infrastructure/words/word_response.dart';
import 'package:wordledict_loader/locator.dart';

class WordsService {
  final SembastDatabase _sembastDatabase;
  final Dio _dio;
  final _store = stringMapStoreFactory.store('words');

  WordsService(this._sembastDatabase, this._dio);

  Future<WordResponse<WordDto>> insertWord(String plainWord) async {
    final existingWord =
        await _store.record(plainWord).get(_sembastDatabase.instance);
    if (existingWord == null) {
      final wordDto = await _getMeaningsFromDictionaryApi(plainWord);

      if (wordDto == null) {
        // Do not save word that has no meaning
        return WordResponse.noMeaning(plainWord);
      }

      await _store
          .record(plainWord)
          .put(_sembastDatabase.instance, wordDto.toJson());
      return WordResponse.withMeaning(wordDto);
    }

    return WordResponse.duplicate(WordDto.fromJson(existingWord));
  }

  Future<void> deleteWord(String id) =>
      _store.record(id).delete(_sembastDatabase.instance);

  Future<List<WordDto>> getWords() => _store
      .find(
        _sembastDatabase.instance,
        finder: Finder(
          sortOrders: [SortOrder(Field.key)],
        ),
      )
      .then(
        (records) => records.map((e) => WordDto.fromJson(e.value)).toList(),
      );

  Future<WordDto?> _getMeaningsFromDictionaryApi(String plainWord) async {
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
        final originAndIndex = (element['meta']['id'] as String).split(':');
        if (origin == null) {
          if (originAndIndex[0].contains(' ')) {
            continue;
          }
          origin = originAndIndex[0];
        } else {
          if (originAndIndex[0] != origin) {
            continue;
          }
        }

        final key = element['meta']['app-shortdef']['fl']; // noun, verb, etc.
        final value = element['meta']['app-shortdef']['def'] as List<dynamic>;
        meanings[key] = value.cast<String>();
      }

      if (origin != null && meanings.isNotEmpty) {
        return WordDto(
          id: plainWord,
          origin: origin,
          meanings: meanings,
        );
      }

      return null;
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        throw RestApiException(503);
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        // TODO: proper error catching
        print(e.toString());
        throw RestApiException(500);
      }
    } catch (e) {
      print(e.toString());
      throw RestApiException(500);
    }
  }
}
