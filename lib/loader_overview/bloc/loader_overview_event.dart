part of 'loader_overview_bloc.dart';

abstract class LoaderOverviewEvent extends Equatable {
  const LoaderOverviewEvent();

  @override
  List<Object> get props => [];
}

class LoaderOverviewStarted extends LoaderOverviewEvent {
  const LoaderOverviewStarted();
}

class LoaderOverviewWordSelected extends LoaderOverviewEvent {
  const LoaderOverviewWordSelected({
    required this.word,
  });

  final Word word;

  @override
  List<Object> get props => [word];
}

class LoaderOverviewWordSubmitted extends LoaderOverviewEvent {
  const LoaderOverviewWordSubmitted({
    required this.plainWord,
  });

  final String plainWord;

  @override
  List<Object> get props => [plainWord];
}
