import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wordledict_loader/core/constants.dart';
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
    on<LoaderOverviewWordMeaningLabelToggled>(
      _onLoaderOverviewWordMeaningLabelToggled,
    );
    on<LoaderOverviewSearchTermChanged>(
      _onLoaderOverviewSearchTermChanged,
    );
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
        allWords: () => words,
        words: () => words,
        searchTermController: () => TextEditingController(),
        wordsTableKey: () => GlobalKey<PaginatedDataTableState>(),
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
            (words) {
              state.searchTermController?.clear();
              final i = words.indexWhere((w) => w.id == word.id);
              state.wordsTableKey?.currentState?.pageTo(i);
              emit(
                state.copyWith(
                  allWords: () => words,
                  words: () => words,
                  message: () => "'${event.plainWord}' has been added",
                  lastSubmittedPlainWord: () => event.plainWord,
                  selectedWord: () => word,
                  expandedLabels: () => word.meanings.keys.toList(),
                ),
              );
            },
          );
        },
        duplicate: (word) {
          state.searchTermController?.clear();
          final i = state.words.indexWhere((w) => w.id == word.id);
          state.wordsTableKey?.currentState?.pageTo(i);
          emit(
            state.copyWith(
              words: () => state.allWords,
              message: () => "'${event.plainWord}' already exists",
              lastSubmittedPlainWord: () => event.plainWord,
              selectedWord: () => word,
              expandedLabels: () => word.meanings.keys.toList(),
            ),
          );
        },
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
        expandedLabels: () => (state.selectedWord?.id != event.word.id)
            ? event.word.meanings.keys.toList()
            : state.expandedLabels,
      ),
    );
  }

  Future<void> _onLoaderOverviewWordMeaningLabelToggled(
    LoaderOverviewWordMeaningLabelToggled event,
    Emitter<LoaderOverviewState> emit,
  ) async {
    if (state.expandedLabels.contains(event.label)) {
      emit(
        state.copyWith(
          expandedLabels: () => state.expandedLabels
              .where((label) => label != event.label)
              .toList(),
        ),
      );
    } else {
      emit(
        state.copyWith(
          expandedLabels: () => [...state.expandedLabels, event.label],
        ),
      );
    }
  }

  Future<void> _onLoaderOverviewSearchTermChanged(
    LoaderOverviewSearchTermChanged event,
    Emitter<LoaderOverviewState> emit,
  ) async {
    final searchTerm = state.searchTermController?.text ?? '';
    state.wordsTableKey?.currentState?.pageTo(0);
    emit(
      state.copyWith(
        words: () => state.allWords
            .where((word) => word.id.contains(searchTerm))
            .toList(),
        selectedWord: () => null,
      ),
    );
  }
}
