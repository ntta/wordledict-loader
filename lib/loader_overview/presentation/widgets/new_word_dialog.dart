import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordledict_loader/loader_overview/bloc/loader_overview_bloc.dart';
import 'package:wordledict_loader/locator.dart';

class NewWordDialog extends StatelessWidget {
  NewWordDialog({Key? key}) : super(key: key);

  final newWordInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New Word'),
      content: Form(
        key: formKey,
        child: TextFormField(
          maxLength: 5,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"(^[A-Za-z]+$)"))
          ],
          validator: (value) {
            if (value == null || value.isEmpty || value.length != 5) {
              return 'A wordle must have 5 letters';
            }
            return null;
          },
          controller: newWordInputController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Enter new word',
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              locator<LoaderOverviewBloc>().add(
                LoaderOverviewWordSubmitted(
                  plainWord: newWordInputController.text.toLowerCase(),
                ),
              );
              Navigator.of(context).pop();
            }
          },
          child: const Text('SUBMIT'),
        ),
      ],
    );
  }
}
