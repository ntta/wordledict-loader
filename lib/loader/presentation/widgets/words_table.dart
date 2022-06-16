import 'package:flutter/material.dart';

class WordsTable extends StatelessWidget {
  WordsTable({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) {
    return DataTable(
      sortColumnIndex: 0,
      sortAscending: true,
      showCheckboxColumn: false,
      showBottomBorder: true,
      columns: const [
        DataColumn(label: Text('#')),
        DataColumn(label: Text('Word')),
        DataColumn(label: Text('Dictionary')),
      ],
      rows: words
          .asMap()
          .entries
          .map(
            (entry) => DataRow(
              onSelectChanged: (bool? selected) {
                if (selected == true) {}
              },
              cells: [
                DataCell(Text('${entry.key + 1}')),
                DataCell(Text(entry.value)),
                const DataCell(Text('')),
              ],
            ),
          )
          .toList(),
    );
  }
}
