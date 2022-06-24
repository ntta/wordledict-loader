import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordledict_loader/core/presentation/widgets/transformed_text.dart';
import 'package:wordledict_loader/loader_overview/bloc/loader_overview_bloc.dart';
import 'package:wordledict_loader/locator.dart';

class WordMeanings extends StatelessWidget {
  const WordMeanings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoaderOverviewBloc, LoaderOverviewState>(
      builder: (context, state) {
        if (state.selectedWord == null) {
          return const Center(
            child: Text('Select a word from the table to see its meaning'),
          );
        }
        return SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.selectedWord!.id,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                Text(
                  state.selectedWord!.origin,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                ExpansionPanelList(
                  key: Key(state.selectedWord!.id),
                  expansionCallback: (panelIndex, isExpanded) {
                    final label =
                        state.selectedWord!.meanings.keys.toList()[panelIndex];
                    locator<LoaderOverviewBloc>().add(
                        LoaderOverviewWordMeaningLabelToggled(label: label));
                  },
                  children: state.selectedWord!.meanings.keys
                      .map(
                        (label) => ExpansionPanel(
                          canTapOnHeader: true,
                          isExpanded: state.expandedLabels.contains(label),
                          headerBuilder: ((context, isExpanded) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Text(
                                    label,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                          body: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...state.selectedWord!.meanings[label]!
                                    .map((line) => Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: TransformedText(line),
                                        ))
                                    .toList(),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
