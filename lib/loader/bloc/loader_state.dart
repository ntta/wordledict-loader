part of 'loader_bloc.dart';

abstract class LoaderState extends Equatable {
  const LoaderState();
}

class LoaderLoadInProgress extends LoaderState {
  const LoaderLoadInProgress();

  @override
  List<Object?> get props => [];
}

class LoaderLoadSuccess extends LoaderState {
  const LoaderLoadSuccess(this.words);

  final List<Word> words;

  @override
  List<Object?> get props => [];
}

class LoaderLoadFailure extends LoaderState {
  const LoaderLoadFailure(this.failure);

  final DictionaryFailure failure;

  @override
  List<Object?> get props => [];
}

class WordSubmitInProgress extends LoaderState {
  const WordSubmitInProgress();

  @override
  List<Object?> get props => [];
}

class WordSubmitSuccess extends LoaderState {
  const WordSubmitSuccess();

  @override
  List<Object?> get props => [];
}
