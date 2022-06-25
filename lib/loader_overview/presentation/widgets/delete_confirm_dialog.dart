import 'package:flutter/material.dart';
import 'package:wordledict_loader/loader_overview/bloc/loader_overview_bloc.dart';
import 'package:wordledict_loader/locator.dart';

class DeleteConfirmDialog extends StatelessWidget {
  const DeleteConfirmDialog(this.wordId, {Key? key}) : super(key: key);

  final String wordId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Please Confirm'),
      content: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          text: 'Are you sure to delete word ',
          children: [
            TextSpan(
              text: wordId,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextSpan(text: '?'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            locator<LoaderOverviewBloc>()
                .add(LoaderOverviewWordDeleted(wordId));
            Navigator.of(context).pop();
          },
          child: const Text('Yes'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('No'),
        ),
      ],
    );
  }
}
