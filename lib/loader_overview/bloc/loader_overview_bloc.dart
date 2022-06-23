import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordledict_loader/core/domain/word.dart';
import 'package:wordledict_loader/core/infrastructure/words/words_repository.dart';

part 'loader_overview_event.dart';
part 'loader_overview_state.dart';

class LoaderOverviewBloc
    extends Bloc<LoaderOverviewEvent, LoaderOverviewState> {
  LoaderOverviewBloc(this._wordsRepository)
      : super(const LoaderOverviewState()) {
    on<LoaderOverviewStarted>(_onLoaderOverviewStarted);
    on<LoaderOverviewWordSubmitted>(_onLoaderOverviewWordSubmitted);
    on<LoaderOverviewWordSelected>(_onLoaderOverviewWordSelected);
  }

  final WordsRepository _wordsRepository;

  Future<void> _onLoaderOverviewStarted(
    LoaderOverviewStarted event,
    Emitter<LoaderOverviewState> emit,
  ) async {
    emit(state.copyWith(status: () => LoaderOverviewStatus.loading));
    final words = await _wordsRepository.getWords();
    emit(
      state.copyWith(
        status: () => LoaderOverviewStatus.success,
        words: () => words,
      ),
    );
  }

  Future<void> _onLoaderOverviewWordSubmitted(
    LoaderOverviewWordSubmitted event,
    Emitter<LoaderOverviewState> emit,
  ) async {
    // emit(state.copyWith(status: () => LoaderOverviewStatus.loading));
    final response = await _wordsRepository.insertPlainWord(event.plainWord);
    if (response.isLeft()) {
      response.leftMap((l) {
        final failureMessage = l.map(api: (_) => 'Error code ${_.errorCode}');
        return emit(
          state.copyWith(
            status: () => LoaderOverviewStatus.failure,
            message: () => failureMessage,
            lastSubmittedPlainWord: () => event.plainWord,
          ),
        );
      });
    } else {
      final wordResponse = response.getOrElse(() => throw UnimplementedError());
      await wordResponse.when(
        noMeaning: () async => emit(
          state.copyWith(
            message: () => "'${event.plainWord}' has no meaning",
            lastSubmittedPlainWord: () => event.plainWord,
          ),
        ),
        withMeaning: (word) async {
          await _wordsRepository.getWords().then(
                (words) => emit(
                  state.copyWith(
                    words: () => words,
                    message: () => "'${event.plainWord}' has been added",
                    lastSubmittedPlainWord: () => event.plainWord,
                  ),
                ),
              );
        },
        duplicate: (word) async => emit(
          state.copyWith(
            message: () => "'${event.plainWord}' already exists",
            lastSubmittedPlainWord: () => event.plainWord,
          ),
        ),
      );
    }
  }

  Future<void> _onLoaderOverviewWordSelected(
    LoaderOverviewWordSelected event,
    Emitter<LoaderOverviewState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedWord: () => event.word,
      ),
    );
  }
}
