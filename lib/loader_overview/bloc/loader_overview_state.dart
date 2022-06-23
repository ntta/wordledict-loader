part of 'loader_overview_bloc.dart';

abstract class LoaderOverviewState extends Equatable {
  const LoaderOverviewState(this.words, this.selectedWord);

  final List<Word> words;
  final Word? selectedWord;
}

class LoaderLoadInProgress extends LoaderOverviewState {
  const LoaderLoadInProgress(List<Word> words, Word? selectedWord)
      : super(words, selectedWord);

  @override
  List<Object?> get props => [];
}

class LoaderLoadSuccess extends LoaderOverviewState {
  const LoaderLoadSuccess(List<Word> words, Word? selectedWord)
      : super(words, selectedWord);

  @override
  List<Object?> get props => [];
}

class LoaderLoadFailure extends LoaderOverviewState {
  const LoaderLoadFailure(List<Word> words, this.failure, Word? selectedWord)
      : super(words, selectedWord);

  final DictionaryFailure failure;

  @override
  List<Object?> get props => [];
}

class WordSubmitFailure extends LoaderOverviewState {
  const WordSubmitFailure(List<Word> words, this.failure, Word? selectedWord)
      : super(words, selectedWord);

  final DictionaryFailure failure;

  @override
  List<Object?> get props => [];
}

class WordSubmitNoMeaning extends LoaderOverviewState {
  const WordSubmitNoMeaning(
      List<Word> words, this.plainWord, Word? selectedWord)
      : super(words, selectedWord);

  final String plainWord;

  @override
  List<Object?> get props => [];
}

class WordSubmitWithMeaning extends LoaderOverviewState {
  const WordSubmitWithMeaning(List<Word> words, this.word, Word? selectedWord)
      : super(words, selectedWord);

  final Word word;

  @override
  List<Object?> get props => [];
}

class WordSubmitDuplicate extends LoaderOverviewState {
  const WordSubmitDuplicate(List<Word> words, this.word, Word? selectedWord)
      : super(words, selectedWord);

  final Word word;

  @override
  List<Object?> get props => [];
}

class SelectedWord extends LoaderOverviewState {
  const SelectedWord(List<Word> words, this.word, Word? selectedWord)
      : super(words, selectedWord);

  final Word? word;

  @override
  List<Object?> get props => [];
}
