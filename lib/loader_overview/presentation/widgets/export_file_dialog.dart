import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordledict_loader/loader_overview/bloc/loader_overview_bloc.dart';
import 'package:wordledict_loader/locator.dart';

class ExportFileDialog extends StatelessWidget {
  const ExportFileDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoaderOverviewBloc, LoaderOverviewState>(
      buildWhen: (previous, current) =>
          previous.fileExportingStatus != current.fileExportingStatus,
      builder: ((context, state) {
        return AlertDialog(
          title: const Text('Exporting words to file'),
          content: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (state.fileExportingStatus ==
                    LoaderOverviewFileExportingStatus.exporting)
                  const CircularProgressIndicator(),
                if (state.fileExportingStatus ==
                    LoaderOverviewFileExportingStatus.exported)
                  const Icon(
                    Icons.done,
                    size: 100,
                    color: Colors.green,
                  ),
                if (state.fileExportingStatus ==
                    LoaderOverviewFileExportingStatus.failed)
                  const Icon(
                    Icons.clear,
                    size: 100,
                    color: Colors.red,
                  ),
                const SizedBox(height: 20),
                Text(state.exportingMessage ?? ''),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: state.fileExportingStatus ==
                      LoaderOverviewFileExportingStatus.exporting
                  ? null
                  : () {
                      locator<LoaderOverviewBloc>()
                          .add(const LoaderOverviewFileExportingCleared());
                      Navigator.of(context).pop();
                    },
              child: const Text('Close'),
            ),
          ],
        );
      }),
    );
  }
}
