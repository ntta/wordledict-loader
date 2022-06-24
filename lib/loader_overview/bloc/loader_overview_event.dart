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

class LoaderOverviewWordMeaningLabelToggled extends LoaderOverviewEvent {
  const LoaderOverviewWordMeaningLabelToggled({
    required this.label,
  });

  final String label;

  @override
  List<Object> get props => [label];
}
