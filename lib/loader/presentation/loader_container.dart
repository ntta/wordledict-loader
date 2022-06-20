import 'package:flutter/material.dart';
import 'package:wordledict_loader/core/domain/word.dart';
import 'package:wordledict_loader/loader/presentation/widgets/buttons_bar.dart';
import 'package:wordledict_loader/loader/presentation/widgets/search_bar.dart';
import 'package:wordledict_loader/loader/presentation/widgets/words_table.dart';

class LoaderContainer extends StatelessWidget {
  const LoaderContainer(
    this.words, {
    Key? key,
  }) : super(key: key);

  final List<Word> words;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              children: [
                const Expanded(child: SearchBar()),
                Expanded(child: Container()),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: WordsTable(words),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Select a word from the table to see its meaning',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                const Expanded(child: ButtonsBar()),
                Expanded(child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
