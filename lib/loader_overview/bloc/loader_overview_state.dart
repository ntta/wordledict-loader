part of 'loader_overview_bloc.dart';

enum LoaderOverviewStatus { initial, loading, success, failure }

class LoaderOverviewState extends Equatable {
  const LoaderOverviewState({
    this.status = LoaderOverviewStatus.initial,
    this.words = const [],
    this.selectedWord,
    this.lastSubmittedPlainWord,
    this.message,
  });

  final LoaderOverviewStatus status;
  final List<Word> words;
  final Word? selectedWord;
  final String? lastSubmittedPlainWord;
  final String? message;

  LoaderOverviewState copyWith({
    LoaderOverviewStatus Function()? status,
    List<Word> Function()? words,
    Word? Function()? selectedWord,
    String? Function()? lastSubmittedPlainWord,
    String? Function()? message,
  }) {
    return LoaderOverviewState(
      status: status != null ? status() : this.status,
      words: words != null ? words() : this.words,
      selectedWord: selectedWord != null ? selectedWord() : this.selectedWord,
      lastSubmittedPlainWord: lastSubmittedPlainWord != null
          ? lastSubmittedPlainWord()
          : this.lastSubmittedPlainWord,
      message:
          message != null ? message() : this.message,
    );
  }

  @override
  List<Object?> get props => [
        status,
        words,
        selectedWord,
        lastSubmittedPlainWord,
        message,
      ];
}
