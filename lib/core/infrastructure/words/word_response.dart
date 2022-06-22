import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_response.freezed.dart';

@freezed
class WordResponse<T> with _$WordResponse<T> {
  const WordResponse._();
  const factory WordResponse.noMeaning() = _NoMeaning<T>;
  const factory WordResponse.withMeaning(T data) = _WithMeaning<T>;
  const factory WordResponse.duplicate(T data) = _Duplicate<T>;
}
