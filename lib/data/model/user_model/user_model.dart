import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final bool? isEmailVerified;
  final String? dob;
  final String? gender;
  final String? phoneNumber;

  UserModel({
    this.id,
    this.name,
    this.isEmailVerified,
    this.email,
    this.dob,
    this.gender,
    this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
