import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordledict_loader/core/domain/word.dart';
import 'package:wordledict_loader/core/infrastructure/network/dictionary_failure.dart';
import 'package:wordledict_loader/core/infrastructure/words/words_repository.dart';

part 'loader_event.dart';
part 'loader_state.dart';

class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  final WordsRepository _wordsRepository;

  LoaderBloc(this._wordsRepository) : super(const LoaderLoadInProgress([])) {
    on<LoaderStarted>(_onLoaderStarted);
    on<WordSubmitted>(_onWordSubmitted);
  }

  Future<void> _onLoaderStarted(
    LoaderStarted event,
    Emitter<LoaderState> emit,
  ) async {
    emit(const LoaderLoadInProgress([]));
    final words = await _wordsRepository.getWords();
    emit(LoaderLoadSuccess(words));
  }

  Future<void> _onWordSubmitted(
    WordSubmitted event,
    Emitter<LoaderState> emit,
  ) async {
    emit(LoaderLoadInProgress(state.words));
    final response = await _wordsRepository.insertPlainWord(event.plainWord);
    if (response.isLeft()) {
      response.leftMap((l) => emit(WordSubmitFailure(state.words, l)));
    } else {
      final wordResponse = response.getOrElse(() => throw UnimplementedError());
      await wordResponse.when(noMeaning: () async {
        emit(WordSubmitNoMeaning(state.words, event.plainWord));
        emit(LoaderLoadSuccess(state.words));
      }, withMeaning: (word) async {
        await _wordsRepository.getWords().then((words) {
          emit(LoaderLoadSuccess(words));
          emit(WordSubmitWithMeaning(words, word));
        });
      }, duplicate: (word) async {
        emit(WordSubmitDuplicate(state.words, word));
        emit(LoaderLoadSuccess(state.words));
      });
    }
  }
}
