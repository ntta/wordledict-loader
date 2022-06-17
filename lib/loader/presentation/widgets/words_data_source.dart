import 'package:flutter/material.dart';

class WordsDataSource extends DataTableSource {
  final words = [
    'beats',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
    'lunch',
  ];

  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: [
        DataCell(Text('${index + 1}')),
        DataCell(Text(words[index])),
        const DataCell(Text('')),
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
