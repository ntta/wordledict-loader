import 'package:flutter/material.dart';

class NewWordDialog extends StatelessWidget {
  NewWordDialog({Key? key}) : super(key: key);

  final _newWordInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New Word'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty || value.length != 5) {
              return 'A wordle must have 5 letters';
            }

            if (!RegExp(r"(^[A-Za-z]+$)").hasMatch(value)) {
              return 'Only letters are allowed';
            }
            return null;
          },
          controller: _newWordInputController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Enter new word',
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              print(_newWordInputController.text);
              Navigator.of(context).pop();
            }
          },
          child: const Text('SUBMIT'),
        ),
      ],
    );
  }
}
