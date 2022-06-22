import 'package:flutter/material.dart';
import 'package:wordledict_loader/core/domain/word.dart';
import 'package:wordledict_loader/loader/presentation/widgets/words_data_source.dart';

class WordsTable extends StatelessWidget {
  const WordsTable(this.words, {Key? key}) : super(key: key);

  final List<Word> words;

  @override
  Widget build(BuildContext context) {
    final wordsDataSource = WordsDataSource(words);
    return SingleChildScrollView(
      child: PaginatedDataTable(
        sortColumnIndex: 0,
        sortAscending: true,
        showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text('#')),
          DataColumn(label: Text('Word')),
          DataColumn(label: Text('Origin')),
        ],
        rowsPerPage: 15,
        source: wordsDataSource,
      ),
    );
  }
}
