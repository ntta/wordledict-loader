part of 'loader_overview_bloc.dart';

enum LoaderOverviewStatus { initial, loading, success, failure }

class LoaderOverviewState extends Equatable {
  const LoaderOverviewState({
    this.status = LoaderOverviewStatus.initial,
    this.words = const [],
    this.selectedWord,
    this.lastSubmittedPlainWord,
    this.message,
    this.expandedLabels = const [],
  });

  final LoaderOverviewStatus status;
  final List<Word> words;
  final Word? selectedWord;
  final String? lastSubmittedPlainWord;
  final String? message;
  final List<String> expandedLabels;

  LoaderOverviewState copyWith({
    LoaderOverviewStatus Function()? status,
    List<Word> Function()? words,
    Word? Function()? selectedWord,
    String? Function()? lastSubmittedPlainWord,
    String? Function()? message,
    List<String> Function()? expandedLabels,
  }) {
    return LoaderOverviewState(
      status: status != null ? status() : this.status,
      words: words != null ? words() : this.words,
      selectedWord: selectedWord != null ? selectedWord() : this.selectedWord,
      lastSubmittedPlainWord: lastSubmittedPlainWord != null
          ? lastSubmittedPlainWord()
          : this.lastSubmittedPlainWord,
      message: message != null ? message() : this.message,
      expandedLabels:
          expandedLabels != null ? expandedLabels() : this.expandedLabels,
    );
  }

  @override
  List<Object?> get props => [
        status,
        words,
        selectedWord,
        lastSubmittedPlainWord,
        message,
        expandedLabels,
      ];
}
