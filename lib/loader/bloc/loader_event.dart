part of 'loader_bloc.dart';

abstract class LoaderEvent extends Equatable {
  const LoaderEvent();
}

class LoaderStarted extends LoaderEvent {
  const LoaderStarted();

  @override
  List<Object?> get props => [];
}

class WordSubmitted extends LoaderEvent {
  const WordSubmitted(this.plainWord);

  final String plainWord;

  @override
  List<Object?> get props => [];
}
