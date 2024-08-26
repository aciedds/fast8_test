// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biodata_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BiodataData {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get dob => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get education => throw _privateConstructorUsedError;
  String get maritalStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BiodataDataCopyWith<BiodataData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiodataDataCopyWith<$Res> {
  factory $BiodataDataCopyWith(
          BiodataData value, $Res Function(BiodataData) then) =
      _$BiodataDataCopyWithImpl<$Res, BiodataData>;
  @useResult
  $Res call(
      {String name,
      String email,
      String dob,
      String gender,
      String phoneNumber,
      String education,
      String maritalStatus});
}

/// @nodoc
class _$BiodataDataCopyWithImpl<$Res, $Val extends BiodataData>
    implements $BiodataDataCopyWith<$Res> {
  _$BiodataDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? dob = null,
    Object? gender = null,
    Object? phoneNumber = null,
    Object? education = null,
    Object? maritalStatus = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      education: null == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String,
      maritalStatus: null == maritalStatus
          ? _value.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BiodataDataImplCopyWith<$Res>
    implements $BiodataDataCopyWith<$Res> {
  factory _$$BiodataDataImplCopyWith(
          _$BiodataDataImpl value, $Res Function(_$BiodataDataImpl) then) =
      __$$BiodataDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      String dob,
      String gender,
      String phoneNumber,
      String education,
      String maritalStatus});
}

/// @nodoc
class __$$BiodataDataImplCopyWithImpl<$Res>
    extends _$BiodataDataCopyWithImpl<$Res, _$BiodataDataImpl>
    implements _$$BiodataDataImplCopyWith<$Res> {
  __$$BiodataDataImplCopyWithImpl(
      _$BiodataDataImpl _value, $Res Function(_$BiodataDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? dob = null,
    Object? gender = null,
    Object? phoneNumber = null,
    Object? education = null,
    Object? maritalStatus = null,
  }) {
    return _then(_$BiodataDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      education: null == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as String,
      maritalStatus: null == maritalStatus
          ? _value.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BiodataDataImpl implements _BiodataData {
  const _$BiodataDataImpl(
      {required this.name,
      required this.email,
      required this.dob,
      required this.gender,
      required this.phoneNumber,
      required this.education,
      required this.maritalStatus});

  @override
  final String name;
  @override
  final String email;
  @override
  final String dob;
  @override
  final String gender;
  @override
  final String phoneNumber;
  @override
  final String education;
  @override
  final String maritalStatus;

  @override
  String toString() {
    return 'BiodataData(name: $name, email: $email, dob: $dob, gender: $gender, phoneNumber: $phoneNumber, education: $education, maritalStatus: $maritalStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiodataDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.maritalStatus, maritalStatus) ||
                other.maritalStatus == maritalStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, dob, gender,
      phoneNumber, education, maritalStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BiodataDataImplCopyWith<_$BiodataDataImpl> get copyWith =>
      __$$BiodataDataImplCopyWithImpl<_$BiodataDataImpl>(this, _$identity);
}

abstract class _BiodataData implements BiodataData {
  const factory _BiodataData(
      {required final String name,
      required final String email,
      required final String dob,
      required final String gender,
      required final String phoneNumber,
      required final String education,
      required final String maritalStatus}) = _$BiodataDataImpl;

  @override
  String get name;
  @override
  String get email;
  @override
  String get dob;
  @override
  String get gender;
  @override
  String get phoneNumber;
  @override
  String get education;
  @override
  String get maritalStatus;
  @override
  @JsonKey(ignore: true)
  _$$BiodataDataImplCopyWith<_$BiodataDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
