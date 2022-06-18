import 'package:sembast/sembast.dart';
import 'package:wordledict_loader/core/infrastructure/database/sembast_database.dart';
import 'package:wordledict_loader/core/infrastructure/words/word_dto.dart';

class LoaderService {
  final SembastDatabase _sembastDatabase;
  final _store = stringMapStoreFactory.store('words');

  LoaderService(this._sembastDatabase);

  Future<void> insertWords(List<String> rawWords) async {
    await _store.records(rawWords).put(
          _sembastDatabase.instance,
          rawWords.map((rawWord) => {'id': rawWord}).toList(),
        );
  }

  Future<List<WordDto>> getWords() async {
    final records = await _store.find(_sembastDatabase.instance);
    return records.map((e) => WordDto.fromJson(e.value)).toList();
  }
}
