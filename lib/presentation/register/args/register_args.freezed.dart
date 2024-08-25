// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterArgs {
  String get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) register,
    required TResult Function(String email, String id) googleSso,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? register,
    TResult? Function(String email, String id)? googleSso,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? register,
    TResult Function(String email, String id)? googleSso,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterArgsRegister value) register,
    required TResult Function(RegisterArgsGoogleSso value) googleSso,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterArgsRegister value)? register,
    TResult? Function(RegisterArgsGoogleSso value)? googleSso,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterArgsRegister value)? register,
    TResult Function(RegisterArgsGoogleSso value)? googleSso,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterArgsCopyWith<RegisterArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterArgsCopyWith<$Res> {
  factory $RegisterArgsCopyWith(
          RegisterArgs value, $Res Function(RegisterArgs) then) =
      _$RegisterArgsCopyWithImpl<$Res, RegisterArgs>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$RegisterArgsCopyWithImpl<$Res, $Val extends RegisterArgs>
    implements $RegisterArgsCopyWith<$Res> {
  _$RegisterArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterArgsRegisterImplCopyWith<$Res>
    implements $RegisterArgsCopyWith<$Res> {
  factory _$$RegisterArgsRegisterImplCopyWith(_$RegisterArgsRegisterImpl value,
          $Res Function(_$RegisterArgsRegisterImpl) then) =
      __$$RegisterArgsRegisterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$RegisterArgsRegisterImplCopyWithImpl<$Res>
    extends _$RegisterArgsCopyWithImpl<$Res, _$RegisterArgsRegisterImpl>
    implements _$$RegisterArgsRegisterImplCopyWith<$Res> {
  __$$RegisterArgsRegisterImplCopyWithImpl(_$RegisterArgsRegisterImpl _value,
      $Res Function(_$RegisterArgsRegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$RegisterArgsRegisterImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterArgsRegisterImpl implements RegisterArgsRegister {
  const _$RegisterArgsRegisterImpl(
      {required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'RegisterArgs.register(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterArgsRegisterImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterArgsRegisterImplCopyWith<_$RegisterArgsRegisterImpl>
      get copyWith =>
          __$$RegisterArgsRegisterImplCopyWithImpl<_$RegisterArgsRegisterImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) register,
    required TResult Function(String email, String id) googleSso,
  }) {
    return register(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? register,
    TResult? Function(String email, String id)? googleSso,
  }) {
    return register?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? register,
    TResult Function(String email, String id)? googleSso,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterArgsRegister value) register,
    required TResult Function(RegisterArgsGoogleSso value) googleSso,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterArgsRegister value)? register,
    TResult? Function(RegisterArgsGoogleSso value)? googleSso,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterArgsRegister value)? register,
    TResult Function(RegisterArgsGoogleSso value)? googleSso,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class RegisterArgsRegister implements RegisterArgs {
  const factory RegisterArgsRegister(
      {required final String email,
      required final String password}) = _$RegisterArgsRegisterImpl;

  @override
  String get email;
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$RegisterArgsRegisterImplCopyWith<_$RegisterArgsRegisterImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterArgsGoogleSsoImplCopyWith<$Res>
    implements $RegisterArgsCopyWith<$Res> {
  factory _$$RegisterArgsGoogleSsoImplCopyWith(
          _$RegisterArgsGoogleSsoImpl value,
          $Res Function(_$RegisterArgsGoogleSsoImpl) then) =
      __$$RegisterArgsGoogleSsoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String id});
}

/// @nodoc
class __$$RegisterArgsGoogleSsoImplCopyWithImpl<$Res>
    extends _$RegisterArgsCopyWithImpl<$Res, _$RegisterArgsGoogleSsoImpl>
    implements _$$RegisterArgsGoogleSsoImplCopyWith<$Res> {
  __$$RegisterArgsGoogleSsoImplCopyWithImpl(_$RegisterArgsGoogleSsoImpl _value,
      $Res Function(_$RegisterArgsGoogleSsoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? id = null,
  }) {
    return _then(_$RegisterArgsGoogleSsoImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterArgsGoogleSsoImpl implements RegisterArgsGoogleSso {
  const _$RegisterArgsGoogleSsoImpl({required this.email, required this.id});

  @override
  final String email;
  @override
  final String id;

  @override
  String toString() {
    return 'RegisterArgs.googleSso(email: $email, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterArgsGoogleSsoImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterArgsGoogleSsoImplCopyWith<_$RegisterArgsGoogleSsoImpl>
      get copyWith => __$$RegisterArgsGoogleSsoImplCopyWithImpl<
          _$RegisterArgsGoogleSsoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) register,
    required TResult Function(String email, String id) googleSso,
  }) {
    return googleSso(email, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? register,
    TResult? Function(String email, String id)? googleSso,
  }) {
    return googleSso?.call(email, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? register,
    TResult Function(String email, String id)? googleSso,
    required TResult orElse(),
  }) {
    if (googleSso != null) {
      return googleSso(email, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterArgsRegister value) register,
    required TResult Function(RegisterArgsGoogleSso value) googleSso,
  }) {
    return googleSso(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterArgsRegister value)? register,
    TResult? Function(RegisterArgsGoogleSso value)? googleSso,
  }) {
    return googleSso?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterArgsRegister value)? register,
    TResult Function(RegisterArgsGoogleSso value)? googleSso,
    required TResult orElse(),
  }) {
    if (googleSso != null) {
      return googleSso(this);
    }
    return orElse();
  }
}

abstract class RegisterArgsGoogleSso implements RegisterArgs {
  const factory RegisterArgsGoogleSso(
      {required final String email,
      required final String id}) = _$RegisterArgsGoogleSsoImpl;

  @override
  String get email;
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$RegisterArgsGoogleSsoImplCopyWith<_$RegisterArgsGoogleSsoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
