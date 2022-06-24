import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wordledict_loader/core/infrastructure/settings/settings_repository.dart';
import 'package:wordledict_loader/locator.dart';

// You may look at this widget and think "WTF is this?"
// I know, I should have used bloc to handle the states
// CONSISTENT IS THE KEY
// I know, I know, I know
// Please forgive me, I just have one setting, my future self will refactor this
class SettingsDialog extends StatefulWidget {
  const SettingsDialog({Key? key}) : super(key: key);

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  final dictionaryApiInputController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isSaveDisabled = true;
  bool isSaving = false;
  String initialDictionaryApi = '';

  @override
  void initState() {
    super.initState();
    dictionaryApiInputController.text =
        locator<SettingsRepository>().dictionaryApiKey ?? '';
    initialDictionaryApi = dictionaryApiInputController.text;
    dictionaryApiInputController.addListener(() {
      setState(() {
        isSaveDisabled =
            dictionaryApiInputController.text == initialDictionaryApi;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Settings'),
      content: SizedBox(
        width: 800,
        child: Form(
          key: formKey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                  text: 'Learner Dictionary API Key',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => launchUrl(
                          Uri.parse(
                              'https://dictionaryapi.com/products/api-learners-dictionary'),
                        ),
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                child: TextFormField(
                  readOnly: isSaving,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 5) {
                      return 'A wordle must have 5 letters';
                    }

                    if (!RegExp(r"(^[A-Za-z]+$)").hasMatch(value)) {
                      return 'Only letters are allowed';
                    }
                    return null;
                  },
                  controller: dictionaryApiInputController,
                  autofocus: true,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        if (isSaving)
          const TextButton(
            onPressed: null,
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            ),
          ),
        if (!isSaving)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('CANCEL'),
          ),
        if (!isSaving)
          TextButton(
            onPressed: isSaveDisabled
                ? null
                : () {
                    setState(() {
                      isSaving = true;
                    });
                    locator<SettingsRepository>()
                        .setDictionaryApiKey(dictionaryApiInputController.text)
                        .then((_) {
                      Navigator.of(context).pop();
                    }).whenComplete(() {
                      setState(() {
                        isSaving = false;
                      });
                    });
                  },
            child: const Text('SAVE'),
          ),
      ],
    );
  }
}
