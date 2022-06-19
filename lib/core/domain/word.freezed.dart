// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Word {
  String get id => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;
  String? get origin => throw _privateConstructorUsedError;
  Map<String, List<String>>? get meanings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WordCopyWith<Word> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) then) =
      _$WordCopyWithImpl<$Res>;
  $Res call(
      {String id,
      bool isChecked,
      String? origin,
      Map<String, List<String>>? meanings});
}

/// @nodoc
class _$WordCopyWithImpl<$Res> implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._value, this._then);

  final Word _value;
  // ignore: unused_field
  final $Res Function(Word) _then;

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
abstract class _$$_WordCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$$_WordCopyWith(_$_Word value, $Res Function(_$_Word) then) =
      __$$_WordCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      bool isChecked,
      String? origin,
      Map<String, List<String>>? meanings});
}

/// @nodoc
class __$$_WordCopyWithImpl<$Res> extends _$WordCopyWithImpl<$Res>
    implements _$$_WordCopyWith<$Res> {
  __$$_WordCopyWithImpl(_$_Word _value, $Res Function(_$_Word) _then)
      : super(_value, (v) => _then(v as _$_Word));

  @override
  _$_Word get _value => super._value as _$_Word;

  @override
  $Res call({
    Object? id = freezed,
    Object? isChecked = freezed,
    Object? origin = freezed,
    Object? meanings = freezed,
  }) {
    return _then(_$_Word(
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

class _$_Word extends _Word {
  const _$_Word(
      {required this.id,
      required this.isChecked,
      required this.origin,
      required final Map<String, List<String>>? meanings})
      : _meanings = meanings,
        super._();

  @override
  final String id;
  @override
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
    return 'Word(id: $id, isChecked: $isChecked, origin: $origin, meanings: $meanings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Word &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.isChecked, isChecked) &&
            const DeepCollectionEquality().equals(other.origin, origin) &&
            const DeepCollectionEquality().equals(other._meanings, _meanings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(isChecked),
      const DeepCollectionEquality().hash(origin),
      const DeepCollectionEquality().hash(_meanings));

  @JsonKey(ignore: true)
  @override
  _$$_WordCopyWith<_$_Word> get copyWith =>
      __$$_WordCopyWithImpl<_$_Word>(this, _$identity);
}

abstract class _Word extends Word {
  const factory _Word(
      {required final String id,
      required final bool isChecked,
      required final String? origin,
      required final Map<String, List<String>>? meanings}) = _$_Word;
  const _Word._() : super._();

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
  _$$_WordCopyWith<_$_Word> get copyWith => throw _privateConstructorUsedError;
}
