import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordledict_loader/loader/bloc/loader_bloc.dart';
import 'package:wordledict_loader/loader/presentation/loader_container.dart';
import 'package:wordledict_loader/settings/presentation/settings_dialog.dart';

class LoaderPage extends StatelessWidget {
  const LoaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wordledict Loader'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return SettingsDialog();
                  });
            },
          ),
        ],
      ),
      body: BlocBuilder<LoaderBloc, LoaderState>(
        buildWhen: (previous, current) => current is LoaderLoadSuccess,
        builder: (context, state) {
          if (state is LoaderLoadSuccess) {
            return LoaderContainer(state.words);
          }

          if (state is LoaderLoadFailure) {
            print('LOAD IS FAILED');
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
