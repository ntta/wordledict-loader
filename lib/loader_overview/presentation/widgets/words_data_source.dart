import 'package:flutter/material.dart';
import 'package:wordledict_loader/core/domain/word.dart';
import 'package:wordledict_loader/loader_overview/bloc/loader_overview_bloc.dart';
import 'package:wordledict_loader/locator.dart';

class WordsDataSource extends DataTableSource {
  WordsDataSource(this.words, this.selectedWord);

  final List<Word> words;
  final Word? selectedWord;

  @override
  DataRow? getRow(int index) {
    return DataRow(
      selected: selectedWord?.id == words[index].id,
      onSelectChanged: (selected) {
        if (selected == true) {
          locator<LoaderOverviewBloc>()
              .add(LoaderOverviewWordSelected(word: words[index]));
        }
      },
      cells: [
        DataCell(Text('${index + 1}')),
        DataCell(Text(words[index].id)),
        DataCell(Text(words[index].origin)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => words.length;

  @override
  int get selectedRowCount => 0;
}
