import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:wordledict_loader/loader_overview/bloc/loader_overview_bloc.dart';
import 'package:wordledict_loader/loader_overview/presentation/widgets/bulk_add_dialog.dart';
import 'package:wordledict_loader/loader_overview/presentation/widgets/new_word_dialog.dart';
import 'package:wordledict_loader/locator.dart';

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          iconSize: 35,
          icon: const Icon(Icons.output),
          onPressed: () {},
        ),
        Expanded(child: Container()),
        IconButton(
          iconSize: 35,
          icon: const Icon(Icons.add_to_photos),
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['txt'],
            );

            if (result != null) {
              // TODO: use file stream instead
              File file = File(result.files.single.path!);
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return const BulkAddDialog();
                },
              );
              locator<LoaderOverviewBloc>().add(LoaderOverviewFilePicked(file));
            }
          },
        ),
        const SizedBox(width: 10),
        IconButton(
          iconSize: 35,
          icon: const Icon(Icons.add_box),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return NewWordDialog();
                });
          },
        ),
      ],
    );
  }
}
