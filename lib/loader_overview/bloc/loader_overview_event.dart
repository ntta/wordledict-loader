part of 'loader_overview_bloc.dart';

abstract class LoaderOverviewEvent extends Equatable {
  const LoaderOverviewEvent();
}

class LoaderStarted extends LoaderOverviewEvent {
  const LoaderStarted();

  @override
  List<Object?> get props => [];
}

class WordSubmitted extends LoaderOverviewEvent {
  const WordSubmitted(this.plainWord);

  final String plainWord;

  @override
  List<Object?> get props => [];
}

class WordSelected extends LoaderOverviewEvent {
  const WordSelected(this.word);

  final Word word;

  @override
  List<Object?> get props => [];
}
