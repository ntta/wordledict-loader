import 'package:flutter/material.dart';
import 'package:wordledict_loader/loader/presentation/widgets/buttons_bar.dart';
import 'package:wordledict_loader/loader/presentation/widgets/search_bar.dart';
import 'package:wordledict_loader/loader/presentation/widgets/words_table.dart';

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
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
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
                    child: WordsTable(),
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
      ),
    );
  }
}
