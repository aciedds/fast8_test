import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_args.freezed.dart';

@freezed
class RegisterArgs with _$RegisterArgs {
  const factory RegisterArgs.register({
    required String email,
    required String password,
  }) = RegisterArgsRegister;

  const factory RegisterArgs.googleSso({
    required String email,
    required String id,
  }) = RegisterArgsGoogleSso;
}
