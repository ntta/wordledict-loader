import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordledict_loader/loader_overview/bloc/loader_overview_bloc.dart';
import 'package:wordledict_loader/locator.dart';

class BulkAddDialog extends StatelessWidget {
  const BulkAddDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoaderOverviewBloc, LoaderOverviewState>(
      buildWhen: (previous, current) =>
          previous.fileProcessingMessages.length !=
              current.fileProcessingMessages.length ||
          previous.fileProcessingStatus != current.fileProcessingStatus,
      builder: (context, state) {
        return AlertDialog(
          title: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style.copyWith(fontSize: 20),
              text: 'Adding words from file ',
              children: [
                TextSpan(
                  text: state.processingFile?.path.split('/').last,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          content: SizedBox(
            width: 800,
            height: 800,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.fileProcessingStatus ==
                      LoaderOverviewFileProcessingStatus.processing)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ...state.fileProcessingMessages
                      .map(
                        (e) => Text('\u2022 $e'),
                      )
                      .toList()
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: state.fileProcessingStatus ==
                      LoaderOverviewFileProcessingStatus.processing
                  ? null
                  : () {
                      locator<LoaderOverviewBloc>()
                          .add(const LoaderOverviewFileProcessingCleared());
                      Navigator.of(context).pop();
                    },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
