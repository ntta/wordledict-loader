import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordledict_loader/loader_overview/bloc/loader_overview_bloc.dart';
import 'package:wordledict_loader/loader_overview/presentation/loader_container.dart';
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
                    return const SettingsDialog();
                  });
            },
          ),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<LoaderOverviewBloc, LoaderOverviewState>(
            listenWhen: (previous, current) =>
                previous.message != current.message,
            listener: ((context, state) {
              if (state.message != null) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(state.message!),
                    ),
                  );
              }
            }),
          ),
        ],
        child: BlocBuilder<LoaderOverviewBloc, LoaderOverviewState>(
          builder: (context, state) {
            if (state.status == LoaderOverviewStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            return const LoaderContainer();
          },
        ),
      ),
    );
  }
}
