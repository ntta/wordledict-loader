// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'word_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WordDto _$WordDtoFromJson(Map<String, dynamic> json) {
  return _WordDto.fromJson(json);
}

/// @nodoc
mixin _$WordDto {
  String get id => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;
  String? get origin => throw _privateConstructorUsedError;
  Map<String, List<String>>? get meanings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordDtoCopyWith<WordDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordDtoCopyWith<$Res> {
  factory $WordDtoCopyWith(WordDto value, $Res Function(WordDto) then) =
      _$WordDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      bool isChecked,
      String? origin,
      Map<String, List<String>>? meanings});
}

/// @nodoc
class _$WordDtoCopyWithImpl<$Res> implements $WordDtoCopyWith<$Res> {
  _$WordDtoCopyWithImpl(this._value, this._then);

  final WordDto _value;
  // ignore: unused_field
  final $Res Function(WordDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? isChecked = freezed,
    Object? origin = freezed,
    Object? meanings = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isChecked: isChecked == freezed
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      origin: origin == freezed
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      meanings: meanings == freezed
          ? _value.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
    ));
  }
}

/// @nodoc
abstract class _$$_WordDtoCopyWith<$Res> implements $WordDtoCopyWith<$Res> {
  factory _$$_WordDtoCopyWith(
          _$_WordDto value, $Res Function(_$_WordDto) then) =
      __$$_WordDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      bool isChecked,
      String? origin,
      Map<String, List<String>>? meanings});
}

/// @nodoc
class __$$_WordDtoCopyWithImpl<$Res> extends _$WordDtoCopyWithImpl<$Res>
    implements _$$_WordDtoCopyWith<$Res> {
  __$$_WordDtoCopyWithImpl(_$_WordDto _value, $Res Function(_$_WordDto) _then)
      : super(_value, (v) => _then(v as _$_WordDto));

  @override
  _$_WordDto get _value => super._value as _$_WordDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? isChecked = freezed,
    Object? origin = freezed,
    Object? meanings = freezed,
  }) {
    return _then(_$_WordDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isChecked: isChecked == freezed
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      origin: origin == freezed
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      meanings: meanings == freezed
          ? _value._meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WordDto extends _WordDto {
  const _$_WordDto(
      {required this.id,
      this.isChecked = false,
      this.origin,
      final Map<String, List<String>>? meanings})
      : _meanings = meanings,
        super._();

  factory _$_WordDto.fromJson(Map<String, dynamic> json) =>
      _$$_WordDtoFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final bool isChecked;
  @override
  final String? origin;
  final Map<String, List<String>>? _meanings;
  @override
  Map<String, List<String>>? get meanings {
    final value = _meanings;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'WordDto(id: $id, isChecked: $isChecked, origin: $origin, meanings: $meanings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.isChecked, isChecked) &&
            const DeepCollectionEquality().equals(other.origin, origin) &&
            const DeepCollectionEquality().equals(other._meanings, _meanings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(isChecked),
      const DeepCollectionEquality().hash(origin),
      const DeepCollectionEquality().hash(_meanings));

  @JsonKey(ignore: true)
  @override
  _$$_WordDtoCopyWith<_$_WordDto> get copyWith =>
      __$$_WordDtoCopyWithImpl<_$_WordDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordDtoToJson(this);
  }
}

abstract class _WordDto extends WordDto {
  const factory _WordDto(
      {required final String id,
      final bool isChecked,
      final String? origin,
      final Map<String, List<String>>? meanings}) = _$_WordDto;
  const _WordDto._() : super._();

  factory _WordDto.fromJson(Map<String, dynamic> json) = _$_WordDto.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  bool get isChecked => throw _privateConstructorUsedError;
  @override
  String? get origin => throw _privateConstructorUsedError;
  @override
  Map<String, List<String>>? get meanings => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WordDtoCopyWith<_$_WordDto> get copyWith =>
      throw _privateConstructorUsedError;
}
