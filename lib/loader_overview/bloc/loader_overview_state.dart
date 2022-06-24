part of 'loader_overview_bloc.dart';

enum LoaderOverviewStatus { initial, loading, success, failure }

class LoaderOverviewState extends Equatable {
  const LoaderOverviewState({
    this.status = LoaderOverviewStatus.initial,
    this.allWords = const [],
    this.words = const [],
    this.selectedWord,
    this.lastSubmittedPlainWord,
    this.message,
    this.expandedLabels = const [],
    this.searchTermController,
    this.wordsTableKey,
  });

  final LoaderOverviewStatus status;
  final List<Word> allWords;
  final List<Word> words;
  final Word? selectedWord;
  final String? lastSubmittedPlainWord;
  final String? message;
  final List<String> expandedLabels;
  final TextEditingController? searchTermController;
  final GlobalKey<PaginatedDataTableState>? wordsTableKey;

  LoaderOverviewState copyWith({
    LoaderOverviewStatus Function()? status,
    List<Word> Function()? allWords,
    List<Word> Function()? words,
    Word? Function()? selectedWord,
    String? Function()? lastSubmittedPlainWord,
    String? Function()? message,
    List<String> Function()? expandedLabels,
    TextEditingController Function()? searchTermController,
    GlobalKey<PaginatedDataTableState> Function()? wordsTableKey,
  }) {
    return LoaderOverviewState(
      status: status != null ? status() : this.status,
      allWords: allWords != null ? allWords() : this.allWords,
      words: words != null ? words() : this.words,
      selectedWord: selectedWord != null ? selectedWord() : this.selectedWord,
      lastSubmittedPlainWord: lastSubmittedPlainWord != null
          ? lastSubmittedPlainWord()
          : this.lastSubmittedPlainWord,
      message: message != null ? message() : this.message,
      expandedLabels:
          expandedLabels != null ? expandedLabels() : this.expandedLabels,
      searchTermController: searchTermController != null
          ? searchTermController()
          : this.searchTermController,
      wordsTableKey:
          wordsTableKey != null ? wordsTableKey() : this.wordsTableKey,
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
        searchTermController,
        wordsTableKey,
      ];
}
