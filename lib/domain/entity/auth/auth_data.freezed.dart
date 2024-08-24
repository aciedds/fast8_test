// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthData {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  bool get emailVerified => throw _privateConstructorUsedError;
  bool get isAnonymous => throw _privateConstructorUsedError;
  List<String> get providerIds => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get creationTime => throw _privateConstructorUsedError;
  String get lastSignInTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthDataCopyWith<AuthData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthDataCopyWith<$Res> {
  factory $AuthDataCopyWith(AuthData value, $Res Function(AuthData) then) =
      _$AuthDataCopyWithImpl<$Res, AuthData>;
  @useResult
  $Res call(
      {String uid,
      String email,
      String displayName,
      bool emailVerified,
      bool isAnonymous,
      List<String> providerIds,
      String phoneNumber,
      String creationTime,
      String lastSignInTime});
}

/// @nodoc
class _$AuthDataCopyWithImpl<$Res, $Val extends AuthData>
    implements $AuthDataCopyWith<$Res> {
  _$AuthDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = null,
    Object? emailVerified = null,
    Object? isAnonymous = null,
    Object? providerIds = null,
    Object? phoneNumber = null,
    Object? creationTime = null,
    Object? lastSignInTime = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      providerIds: null == providerIds
          ? _value.providerIds
          : providerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      creationTime: null == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastSignInTime: null == lastSignInTime
          ? _value.lastSignInTime
          : lastSignInTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthDataImplCopyWith<$Res>
    implements $AuthDataCopyWith<$Res> {
  factory _$$AuthDataImplCopyWith(
          _$AuthDataImpl value, $Res Function(_$AuthDataImpl) then) =
      __$$AuthDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String email,
      String displayName,
      bool emailVerified,
      bool isAnonymous,
      List<String> providerIds,
      String phoneNumber,
      String creationTime,
      String lastSignInTime});
}

/// @nodoc
class __$$AuthDataImplCopyWithImpl<$Res>
    extends _$AuthDataCopyWithImpl<$Res, _$AuthDataImpl>
    implements _$$AuthDataImplCopyWith<$Res> {
  __$$AuthDataImplCopyWithImpl(
      _$AuthDataImpl _value, $Res Function(_$AuthDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = null,
    Object? emailVerified = null,
    Object? isAnonymous = null,
    Object? providerIds = null,
    Object? phoneNumber = null,
    Object? creationTime = null,
    Object? lastSignInTime = null,
  }) {
    return _then(_$AuthDataImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      providerIds: null == providerIds
          ? _value._providerIds
          : providerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      creationTime: null == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as String,
      lastSignInTime: null == lastSignInTime
          ? _value.lastSignInTime
          : lastSignInTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthDataImpl implements _AuthData {
  const _$AuthDataImpl(
      {required this.uid,
      required this.email,
      required this.displayName,
      required this.emailVerified,
      required this.isAnonymous,
      required final List<String> providerIds,
      required this.phoneNumber,
      required this.creationTime,
      required this.lastSignInTime})
      : _providerIds = providerIds;

  @override
  final String uid;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final bool emailVerified;
  @override
  final bool isAnonymous;
  final List<String> _providerIds;
  @override
  List<String> get providerIds {
    if (_providerIds is EqualUnmodifiableListView) return _providerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_providerIds);
  }

  @override
  final String phoneNumber;
  @override
  final String creationTime;
  @override
  final String lastSignInTime;

  @override
  String toString() {
    return 'AuthData(uid: $uid, email: $email, displayName: $displayName, emailVerified: $emailVerified, isAnonymous: $isAnonymous, providerIds: $providerIds, phoneNumber: $phoneNumber, creationTime: $creationTime, lastSignInTime: $lastSignInTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthDataImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            const DeepCollectionEquality()
                .equals(other._providerIds, _providerIds) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.creationTime, creationTime) ||
                other.creationTime == creationTime) &&
            (identical(other.lastSignInTime, lastSignInTime) ||
                other.lastSignInTime == lastSignInTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      email,
      displayName,
      emailVerified,
      isAnonymous,
      const DeepCollectionEquality().hash(_providerIds),
      phoneNumber,
      creationTime,
      lastSignInTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthDataImplCopyWith<_$AuthDataImpl> get copyWith =>
      __$$AuthDataImplCopyWithImpl<_$AuthDataImpl>(this, _$identity);
}

abstract class _AuthData implements AuthData {
  const factory _AuthData(
      {required final String uid,
      required final String email,
      required final String displayName,
      required final bool emailVerified,
      required final bool isAnonymous,
      required final List<String> providerIds,
      required final String phoneNumber,
      required final String creationTime,
      required final String lastSignInTime}) = _$AuthDataImpl;

  @override
  String get uid;
  @override
  String get email;
  @override
  String get displayName;
  @override
  bool get emailVerified;
  @override
  bool get isAnonymous;
  @override
  List<String> get providerIds;
  @override
  String get phoneNumber;
  @override
  String get creationTime;
  @override
  String get lastSignInTime;
  @override
  @JsonKey(ignore: true)
  _$$AuthDataImplCopyWith<_$AuthDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
