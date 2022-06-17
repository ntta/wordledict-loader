import 'package:flutter/material.dart';
import 'package:wordledict_loader/loader/presentation/widgets/words_data_source.dart';

class WordsTable extends StatelessWidget {
  WordsTable({Key? key}) : super(key: key);

  final wordsDataSource = WordsDataSource();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        sortColumnIndex: 0,
        sortAscending: true,
        showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text('#')),
          DataColumn(label: Text('Word')),
          DataColumn(label: Text('Dictionary')),
        ],
        rowsPerPage: 15,
        source: wordsDataSource,
      ),
    );
  }
}
