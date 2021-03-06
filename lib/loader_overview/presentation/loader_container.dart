import 'package:flutter/material.dart';
import 'package:wordledict_loader/loader_overview/presentation/widgets/buttons_bar.dart';
import 'package:wordledict_loader/loader_overview/presentation/widgets/search_bar.dart';
import 'package:wordledict_loader/loader_overview/presentation/widgets/word_meanings.dart';
import 'package:wordledict_loader/loader_overview/presentation/widgets/words_table.dart';

class LoaderContainer extends StatelessWidget {
  const LoaderContainer({Key? key}) : super(key: key);

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(
                  child: WordsTable(),
                ),
                Expanded(
                  child: WordMeanings(),
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
