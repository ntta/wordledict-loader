import 'package:flutter/material.dart';
import 'package:wordledict_loader/core/domain/word.dart';

class WordsDataSource extends DataTableSource {
  final List<Word> words;

  WordsDataSource(this.words);

  @override
  DataRow? getRow(int index) {
    return DataRow(
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
