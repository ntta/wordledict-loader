// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'remote_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RemoteResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(T data) withData,
    required TResult Function() withNoData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? withData,
    TResult Function()? withNoData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? withData,
    TResult Function()? withNoData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_WithData<T> value) withData,
    required TResult Function(_WithNoData<T> value) withNoData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_WithData<T> value)? withData,
    TResult Function(_WithNoData<T> value)? withNoData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_WithData<T> value)? withData,
    TResult Function(_WithNoData<T> value)? withNoData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteResponseCopyWith<T, $Res> {
  factory $RemoteResponseCopyWith(
          RemoteResponse<T> value, $Res Function(RemoteResponse<T>) then) =
      _$RemoteResponseCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$RemoteResponseCopyWithImpl<T, $Res>
    implements $RemoteResponseCopyWith<T, $Res> {
  _$RemoteResponseCopyWithImpl(this._value, this._then);

  final RemoteResponse<T> _value;
  // ignore: unused_field
  final $Res Function(RemoteResponse<T>) _then;
}

/// @nodoc
abstract class _$$_NoConnectionCopyWith<T, $Res> {
  factory _$$_NoConnectionCopyWith(
          _$_NoConnection<T> value, $Res Function(_$_NoConnection<T>) then) =
      __$$_NoConnectionCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_NoConnectionCopyWithImpl<T, $Res>
    extends _$RemoteResponseCopyWithImpl<T, $Res>
    implements _$$_NoConnectionCopyWith<T, $Res> {
  __$$_NoConnectionCopyWithImpl(
      _$_NoConnection<T> _value, $Res Function(_$_NoConnection<T>) _then)
      : super(_value, (v) => _then(v as _$_NoConnection<T>));

  @override
  _$_NoConnection<T> get _value => super._value as _$_NoConnection<T>;
}

/// @nodoc

class _$_NoConnection<T> extends _NoConnection<T> {
  const _$_NoConnection() : super._();

  @override
  String toString() {
    return 'RemoteResponse<$T>.noConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NoConnection<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(T data) withData,
    required TResult Function() withNoData,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? withData,
    TResult Function()? withNoData,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? withData,
    TResult Function()? withNoData,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_WithData<T> value) withData,
    required TResult Function(_WithNoData<T> value) withNoData,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_WithData<T> value)? withData,
    TResult Function(_WithNoData<T> value)? withNoData,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_WithData<T> value)? withData,
    TResult Function(_WithNoData<T> value)? withNoData,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class _NoConnection<T> extends RemoteResponse<T> {
  const factory _NoConnection() = _$_NoConnection<T>;
  const _NoConnection._() : super._();
}

/// @nodoc
abstract class _$$_WithDataCopyWith<T, $Res> {
  factory _$$_WithDataCopyWith(
          _$_WithData<T> value, $Res Function(_$_WithData<T>) then) =
      __$$_WithDataCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$$_WithDataCopyWithImpl<T, $Res>
    extends _$RemoteResponseCopyWithImpl<T, $Res>
    implements _$$_WithDataCopyWith<T, $Res> {
  __$$_WithDataCopyWithImpl(
      _$_WithData<T> _value, $Res Function(_$_WithData<T>) _then)
      : super(_value, (v) => _then(v as _$_WithData<T>));

  @override
  _$_WithData<T> get _value => super._value as _$_WithData<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_WithData<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_WithData<T> extends _WithData<T> {
  const _$_WithData(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'RemoteResponse<$T>.withData(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WithData<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_WithDataCopyWith<T, _$_WithData<T>> get copyWith =>
      __$$_WithDataCopyWithImpl<T, _$_WithData<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(T data) withData,
    required TResult Function() withNoData,
  }) {
    return withData(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? withData,
    TResult Function()? withNoData,
  }) {
    return withData?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? withData,
    TResult Function()? withNoData,
    required TResult orElse(),
  }) {
    if (withData != null) {
      return withData(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_WithData<T> value) withData,
    required TResult Function(_WithNoData<T> value) withNoData,
  }) {
    return withData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_WithData<T> value)? withData,
    TResult Function(_WithNoData<T> value)? withNoData,
  }) {
    return withData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_WithData<T> value)? withData,
    TResult Function(_WithNoData<T> value)? withNoData,
    required TResult orElse(),
  }) {
    if (withData != null) {
      return withData(this);
    }
    return orElse();
  }
}

abstract class _WithData<T> extends RemoteResponse<T> {
  const factory _WithData(final T data) = _$_WithData<T>;
  const _WithData._() : super._();

  T get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_WithDataCopyWith<T, _$_WithData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_WithNoDataCopyWith<T, $Res> {
  factory _$$_WithNoDataCopyWith(
          _$_WithNoData<T> value, $Res Function(_$_WithNoData<T>) then) =
      __$$_WithNoDataCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_WithNoDataCopyWithImpl<T, $Res>
    extends _$RemoteResponseCopyWithImpl<T, $Res>
    implements _$$_WithNoDataCopyWith<T, $Res> {
  __$$_WithNoDataCopyWithImpl(
      _$_WithNoData<T> _value, $Res Function(_$_WithNoData<T>) _then)
      : super(_value, (v) => _then(v as _$_WithNoData<T>));

  @override
  _$_WithNoData<T> get _value => super._value as _$_WithNoData<T>;
}

/// @nodoc

class _$_WithNoData<T> extends _WithNoData<T> {
  const _$_WithNoData() : super._();

  @override
  String toString() {
    return 'RemoteResponse<$T>.withNoData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_WithNoData<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noConnection,
    required TResult Function(T data) withData,
    required TResult Function() withNoData,
  }) {
    return withNoData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? withData,
    TResult Function()? withNoData,
  }) {
    return withNoData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noConnection,
    TResult Function(T data)? withData,
    TResult Function()? withNoData,
    required TResult orElse(),
  }) {
    if (withNoData != null) {
      return withNoData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection<T> value) noConnection,
    required TResult Function(_WithData<T> value) withData,
    required TResult Function(_WithNoData<T> value) withNoData,
  }) {
    return withNoData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_WithData<T> value)? withData,
    TResult Function(_WithNoData<T> value)? withNoData,
  }) {
    return withNoData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection<T> value)? noConnection,
    TResult Function(_WithData<T> value)? withData,
    TResult Function(_WithNoData<T> value)? withNoData,
    required TResult orElse(),
  }) {
    if (withNoData != null) {
      return withNoData(this);
    }
    return orElse();
  }
}

abstract class _WithNoData<T> extends RemoteResponse<T> {
  const factory _WithNoData() = _$_WithNoData<T>;
  const _WithNoData._() : super._();
}
