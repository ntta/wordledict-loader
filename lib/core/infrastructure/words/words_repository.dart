import 'package:dartz/dartz.dart';
import 'package:wordledict_loader/core/domain/fresh.dart';
import 'package:wordledict_loader/core/domain/word.dart';
import 'package:wordledict_loader/core/infrastructure/network/dictionary_failure.dart';
import 'package:wordledict_loader/core/infrastructure/network/rest_api_exception.dart';
import 'package:wordledict_loader/core/infrastructure/words/words_service.dart';

class WordsRepository {
  final WordsService _wordsService;

  WordsRepository(this._wordsService);

  Future<List<Word>> getWords() => _wordsService.getWords().then(
        (wordDtos) => wordDtos.map((dto) => dto.toDomain()).toList(),
      );

  Future<void> insertRawWord(String rawWord) =>
      _wordsService.insertRawWord(rawWord);

  Future<Either<DictionaryFailure, Fresh<Word>>> getAndSaveWord(
    String rawWord,
  ) async {
    try {
    // TODO: map value from word service to have a proper return value
    final wordDtoResponse =
        await _wordsService.getWordFromDictionaryApi(rawWord);
  } on RestApiException catch (e) {
      return left(DictionaryFailure.api(e.errorCode));
    }
  }
}
