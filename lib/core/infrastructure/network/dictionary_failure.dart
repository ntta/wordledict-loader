import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary_failure.freezed.dart';

@freezed
class DictionaryFailure with _$DictionaryFailure {
  const DictionaryFailure._();
  const factory DictionaryFailure.api(int? errorCode) = _Api;
}
