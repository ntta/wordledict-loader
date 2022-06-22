part of 'loader_bloc.dart';

abstract class LoaderState extends Equatable {
  const LoaderState(this.words);

  final List<Word> words;
}

class LoaderLoadInProgress extends LoaderState {
  const LoaderLoadInProgress(List<Word> words) : super(words);

  @override
  List<Object?> get props => [];
}

class LoaderLoadSuccess extends LoaderState {
  const LoaderLoadSuccess(List<Word> words) : super(words);

  @override
  List<Object?> get props => [];
}

class LoaderLoadFailure extends LoaderState {
  const LoaderLoadFailure(List<Word> words, this.failure) : super(words);

  final DictionaryFailure failure;

  @override
  List<Object?> get props => [];
}

class WordSubmitFailure extends LoaderState {
  const WordSubmitFailure(List<Word> words, this.failure) : super(words);

  final DictionaryFailure failure;

  @override
  List<Object?> get props => [];
}

class WordSubmitNoMeaning extends LoaderState {
  const WordSubmitNoMeaning(List<Word> words, this.plainWord) : super(words);

  final String plainWord;

  @override
  List<Object?> get props => [];
}

class WordSubmitWithMeaning extends LoaderState {
  const WordSubmitWithMeaning(List<Word> words, this.word) : super(words);

  final Word word;

  @override
  List<Object?> get props => [];
}

class WordSubmitDuplicate extends LoaderState {
  const WordSubmitDuplicate(List<Word> words, this.word) : super(words);

  final Word word;

  @override
  List<Object?> get props => [];
}
