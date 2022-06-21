import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordledict_loader/core/domain/word.dart';
import 'package:wordledict_loader/core/infrastructure/network/dictionary_failure.dart';
import 'package:wordledict_loader/core/infrastructure/words/words_repository.dart';

part 'loader_event.dart';
part 'loader_state.dart';

class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  final WordsRepository _wordsRepository;

  LoaderBloc(this._wordsRepository) : super(const LoaderLoadInProgress()) {
    on<LoaderStarted>(_onLoaderStarted);
    on<WordSubmitted>(_onWordSubmitted);
  }

  Future<void> _onLoaderStarted(
    LoaderStarted event,
    Emitter<LoaderState> emit,
  ) async {
    emit(const LoaderLoadInProgress());
    final words = await _wordsRepository.getWords();
    emit(LoaderLoadSuccess(words));
  }

    Future<void> _onWordSubmitted(
    WordSubmitted event,
    Emitter<LoaderState> emit,
  ) async {
    emit(const WordSubmitInProgress());
    await _wordsRepository.insertPlainWord(event.plainWord);
    emit(const WordSubmitSuccess());
  }
}
