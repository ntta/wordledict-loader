
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordledict_loader/core/domain/word.dart';

part 'word_dto.freezed.dart';
part 'word_dto.g.dart';

@freezed
class WordDto with _$WordDto {
  const WordDto._();
  const factory WordDto({
    required String id,
    required String? origin,
    required Map<String, List<String>>? meanings,
  }) = _WordDto;

  factory WordDto.fromJson(Map<String, dynamic> json) =>
      _$WordDtoFromJson(json);

  factory WordDto.fromDomain(Word _) {
    return WordDto(
      id: _.id,
      origin: _.origin,
      meanings: _.meanings,
    );
  }

  Word toDomain() {
    return Word(
      id: id,
      origin: origin,
      meanings: meanings,
    );
  }
}
