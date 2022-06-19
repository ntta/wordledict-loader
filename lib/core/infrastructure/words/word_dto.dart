
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wordledict_loader/core/domain/word.dart';

part 'word_dto.freezed.dart';
part 'word_dto.g.dart';

@freezed
class WordDto with _$WordDto {
  const WordDto._();
  const factory WordDto({
    required String id,
    @Default(false) bool isChecked,
    String? origin,
    Map<String, List<String>>? meanings,
  }) = _WordDto;

  factory WordDto.fromJson(Map<String, dynamic> json) =>
      _$WordDtoFromJson(json);

  factory WordDto.fromDomain(Word _) {
    return WordDto(
      id: _.id,
      isChecked: _.isChecked,
      origin: _.origin,
      meanings: _.meanings,
    );
  }

  Word toDomain() {
    return Word(
      id: id,
      isChecked: isChecked,
      origin: origin,
      meanings: meanings,
    );
  }
}
