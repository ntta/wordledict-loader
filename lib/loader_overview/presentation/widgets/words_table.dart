import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordledict_loader/loader_overview/bloc/loader_overview_bloc.dart';
import 'package:wordledict_loader/loader_overview/presentation/widgets/words_data_source.dart';

class WordsTable extends StatelessWidget {
  const WordsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoaderOverviewBloc, LoaderOverviewState>(
      builder: (context, state) {
        final wordsDataSource =
            WordsDataSource(state.words, state.selectedWord);
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
      },
    );
  }
}
