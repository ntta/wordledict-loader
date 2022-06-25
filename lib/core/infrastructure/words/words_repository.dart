import 'package:dartz/dartz.dart';
import 'package:wordledict_loader/core/domain/word.dart';
import 'package:wordledict_loader/core/infrastructure/network/dictionary_failure.dart';
import 'package:wordledict_loader/core/infrastructure/network/rest_api_exception.dart';
import 'package:wordledict_loader/core/infrastructure/words/word_response.dart';
import 'package:wordledict_loader/core/infrastructure/words/words_service.dart';

class WordsRepository {
  final WordsService _wordsService;

  WordsRepository(this._wordsService);

  Future<List<Word>> getWords() => _wordsService.getWords().then(
        (wordDtos) => wordDtos.map((dto) => dto.toDomain()).toList(),
      );

  Future<Either<DictionaryFailure, WordResponse<Word>>> insertPlainWord(
    String plainWord,
  ) async {
    try {
      final wordResponse = await _wordsService.insertWord(plainWord);
      return right(
        wordResponse.when(
          noMeaning: () => const WordResponse.noMeaning(),
          withMeaning: (wordDto) =>
              WordResponse.withMeaning(wordDto.toDomain()),
          duplicate: (wordDto) => WordResponse.duplicate(wordDto.toDomain()),
        ),
      );
    } on RestApiException catch (e) {
      return left(DictionaryFailure.api(e.errorCode));
    }
  }

  Future<void> deleteWord(String id) => _wordsService.deleteWord(id);
}
