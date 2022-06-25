import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordledict_loader/loader_overview/bloc/loader_overview_bloc.dart';
import 'package:wordledict_loader/locator.dart';

class BulkAddDialog extends StatelessWidget {
  const BulkAddDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoaderOverviewBloc, LoaderOverviewState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Adding Words'),
          content: SizedBox(
            width: 800,
            height: 800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
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
                const SizedBox(height: 100),
                if (state.fileProcessingMessages.isEmpty)
                  const CircularProgressIndicator(),
                if (state.fileProcessingMessages.isNotEmpty)
                  SingleChildScrollView(
                    child: Column(
                      children: state.fileProcessingMessages
                          .map(
                            (e) => Text(e),
                          )
                          .toList(),
                    ),
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: state.fileProcessingMessages.isEmpty
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
