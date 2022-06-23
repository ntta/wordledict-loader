import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordledict_loader/core/domain/word.dart';
import 'package:wordledict_loader/core/infrastructure/network/dictionary_failure.dart';
import 'package:wordledict_loader/core/infrastructure/words/words_repository.dart';

part 'loader_overview_event.dart';
part 'loader_overview_state.dart';

class LoaderOverviewBloc extends Bloc<LoaderOverviewEvent, LoaderOverviewState> {
  final WordsRepository _wordsRepository;

  LoaderOverviewBloc(this._wordsRepository)
      : super(const LoaderLoadInProgress([], null)) {
    on<LoaderStarted>(_onLoaderStarted);
    on<WordSubmitted>(_onWordSubmitted);
    on<WordSelected>(_onWordSelected);
  }

  Future<void> _onLoaderStarted(
    LoaderStarted event,
    Emitter<LoaderOverviewState> emit,
  ) async {
    emit(const LoaderLoadInProgress([], null));
    final words = await _wordsRepository.getWords();
    emit(LoaderLoadSuccess(words, null));
  }

  Future<void> _onWordSubmitted(
    WordSubmitted event,
    Emitter<LoaderOverviewState> emit,
  ) async {
    // My gut tells me something is wrong in this function
    // Looks like the state emittings are not right
    emit(LoaderLoadInProgress(state.words, state.selectedWord));
    final response = await _wordsRepository.insertPlainWord(event.plainWord);
    if (response.isLeft()) {
      response.leftMap(
          (l) => emit(WordSubmitFailure(state.words, l, state.selectedWord)));
    } else {
      final wordResponse = response.getOrElse(() => throw UnimplementedError());
      await wordResponse.when(noMeaning: () async {
        emit(WordSubmitNoMeaning(
            state.words, event.plainWord, state.selectedWord));
        emit(LoaderLoadSuccess(state.words, state.selectedWord));
      }, withMeaning: (word) async {
        await _wordsRepository.getWords().then((words) {
          emit(LoaderLoadSuccess(words, state.selectedWord));
          emit(WordSubmitWithMeaning(words, word, state.selectedWord));
        });
      }, duplicate: (word) async {
        emit(WordSubmitDuplicate(state.words, word, state.selectedWord));
        emit(LoaderLoadSuccess(state.words, state.selectedWord));
      });
    }
  }

  Future<void> _onWordSelected(
    WordSelected event,
    Emitter<LoaderOverviewState> emit,
  ) async {
    emit(SelectedWord(state.words, event.word, state.selectedWord));
  }
}
