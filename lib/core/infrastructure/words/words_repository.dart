import 'package:dartz/dartz.dart';
import 'package:wordledict_loader/core/domain/word.dart';
import 'package:wordledict_loader/core/infrastructure/network/dictionary_failure.dart';
import 'package:wordledict_loader/core/infrastructure/network/rest_api_exception.dart';
import 'package:wordledict_loader/core/infrastructure/words/word_dto.dart';
import 'package:wordledict_loader/core/infrastructure/words/words_service.dart';

class WordsRepository {
  final WordsService _wordsService;

  WordsRepository(this._wordsService);

  Future<List<Word>> getWords() => _wordsService.getWords().then(
        (wordDtos) => wordDtos.map((dto) => dto.toDomain()).toList(),
      );

  Future<void> insertPlainWord(String plainWord) =>
      _wordsService.insertPlainWord(plainWord);

  Future<void> insertPlainWords(List<String> plainWords) =>
      _wordsService.insertPlainWords(plainWords);

  Future<Either<DictionaryFailure, Word>> getWordFromDictionaryApi(
    Word word,
  ) async {
    try {
      final wordDtoResponse = await _wordsService
          .getWordFromDictionaryApi(WordDto.fromDomain(word));
      return right(wordDtoResponse.toDomain());
    } on RestApiException catch (e) {
      return left(DictionaryFailure.api(e.errorCode));
    }
  }

  Future<Either<DictionaryFailure, Unit>> getAndSaveAllWordMeanings() async {
    // Look for words that don't have meanings and get meanings for them
    try {
      final uncheckedWords = await _wordsService.getUncheckedWords();
      final futures = uncheckedWords
          .map((wordDto) => _wordsService.getWordFromDictionaryApi(wordDto))
          .toList();
      await Future.wait(futures);
      return right(unit);
    } on RestApiException catch (e) {
      return left(DictionaryFailure.api(e.errorCode));
    }
  }
}
