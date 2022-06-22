import 'package:freezed_annotation/freezed_annotation.dart';

part 'word.freezed.dart';

@freezed
class Word with _$Word {
  const Word._();
  const factory Word({
    required String id,
    required String origin,
    required Map<String, List<String>> meanings,
  }) = _Word;
}
