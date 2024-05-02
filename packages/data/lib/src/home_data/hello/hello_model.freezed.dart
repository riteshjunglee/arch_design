// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hello_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HelloModel {
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HelloModelCopyWith<HelloModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelloModelCopyWith<$Res> {
  factory $HelloModelCopyWith(
          HelloModel value, $Res Function(HelloModel) then) =
      _$HelloModelCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$HelloModelCopyWithImpl<$Res> implements $HelloModelCopyWith<$Res> {
  _$HelloModelCopyWithImpl(this._value, this._then);

  final HelloModel _value;
  // ignore: unused_field
  final $Res Function(HelloModel) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_HelloModelCopyWith<$Res>
    implements $HelloModelCopyWith<$Res> {
  factory _$$_HelloModelCopyWith(
          _$_HelloModel value, $Res Function(_$_HelloModel) then) =
      __$$_HelloModelCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$$_HelloModelCopyWithImpl<$Res> extends _$HelloModelCopyWithImpl<$Res>
    implements _$$_HelloModelCopyWith<$Res> {
  __$$_HelloModelCopyWithImpl(
      _$_HelloModel _value, $Res Function(_$_HelloModel) _then)
      : super(_value, (v) => _then(v as _$_HelloModel));

  @override
  _$_HelloModel get _value => super._value as _$_HelloModel;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_HelloModel(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HelloModel extends _HelloModel {
  const _$_HelloModel({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'HelloModel(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HelloModel &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_HelloModelCopyWith<_$_HelloModel> get copyWith =>
      __$$_HelloModelCopyWithImpl<_$_HelloModel>(this, _$identity);
}

abstract class _HelloModel extends HelloModel {
  const factory _HelloModel({required final String message}) = _$_HelloModel;
  const _HelloModel._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_HelloModelCopyWith<_$_HelloModel> get copyWith =>
      throw _privateConstructorUsedError;
}
