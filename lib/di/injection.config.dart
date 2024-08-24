// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:get_it/get_it.dart' as _i174;
import 'package:fast8_test/data/repository/auth_repository_impl.dart' as _i322;
import 'package:fast8_test/data/repository/post_repository_impl.dart' as _i461;
import 'package:fast8_test/data/repository/user_repository_impl.dart' as _i803;
import 'package:fast8_test/data/source/auth_remote_source.dart' as _i85;
import 'package:fast8_test/data/source/post_remote_source.dart' as _i302;
import 'package:fast8_test/data/source/user_remote_source.dart' as _i424;
import 'package:fast8_test/di/modules/injection_modules.dart' as _i981;
import 'package:fast8_test/domain/mapper/auth_mapper.dart' as _i960;
import 'package:fast8_test/domain/mapper/post_mapper.dart' as _i525;
import 'package:fast8_test/domain/mapper/user_mapper.dart' as _i725;
import 'package:fast8_test/domain/repository/auth_repository.dart' as _i189;
import 'package:fast8_test/domain/repository/post_repository.dart' as _i221;
import 'package:fast8_test/domain/repository/user_repository.dart' as _i397;
import 'package:fast8_test/domain/usecase/forgot_password_uc.dart' as _i63;
import 'package:fast8_test/domain/usecase/get_current_user_uc.dart' as _i562;
import 'package:fast8_test/domain/usecase/get_list_post_uc.dart' as _i333;
import 'package:fast8_test/domain/usecase/get_list_user_uc.dart' as _i626;
import 'package:fast8_test/domain/usecase/get_post_uc.dart' as _i458;
import 'package:fast8_test/domain/usecase/get_user_data_uc.dart' as _i430;
import 'package:fast8_test/domain/usecase/login_google_uc.dart' as _i1044;
import 'package:fast8_test/domain/usecase/login_uc.dart' as _i71;
import 'package:fast8_test/domain/usecase/logout_uc.dart' as _i799;
import 'package:fast8_test/domain/usecase/register_uc.dart' as _i540;
import 'package:fast8_test/domain/usecase/send_email_verification_uc.dart'
    as _i209;
import 'package:fast8_test/domain/usecase/update_email_uc.dart' as _i437;
import 'package:fast8_test/domain/usecase/update_first_name_last_name_uc.dart'
    as _i242;
import 'package:fast8_test/domain/usecase/update_password_uc.dart' as _i1069;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModules = _$InjectionModules();
    gh.singleton<_i59.FirebaseAuth>(() => injectionModules.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
        () => injectionModules.cloudFireStore);
    gh.lazySingleton<_i982.FirebaseApp>(() => injectionModules.firebaseApp);
    await gh.lazySingletonAsync<_i361.Dio>(
      () => injectionModules.client(),
      preResolve: true,
    );
    gh.lazySingleton<_i960.AuthMapper>(() => _i960.AuthMapper());
    gh.lazySingleton<_i525.PostMapper>(() => _i525.PostMapper());
    gh.lazySingleton<_i725.UserMapper>(() => _i725.UserMapper());
    gh.lazySingleton<_i424.UsersRemote>(
        () => _i424.UsersRemote(gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i302.PostRemoteSource>(
        () => _i302.PostRemoteSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i397.UserRepository>(() => _i803.UserRepositoryImpl(
          gh<_i424.UsersRemote>(),
          gh<_i725.UserMapper>(),
        ));
    gh.lazySingleton<_i85.AuthRemote>(
        () => _i85.AuthRemote(gh<_i59.FirebaseAuth>()));
    gh.factory<_i626.GetListUserUc>(
        () => _i626.GetListUserUc(gh<_i397.UserRepository>()));
    gh.factory<_i430.GetUserDataUc>(
        () => _i430.GetUserDataUc(gh<_i397.UserRepository>()));
    gh.lazySingleton<_i221.PostRepository>(() => _i461.PostRepositoryImpl(
          gh<_i302.PostRemoteSource>(),
          gh<_i525.PostMapper>(),
        ));
    gh.lazySingleton<_i189.AuthRepository>(() => _i322.AuthRepositoryImpl(
          gh<_i85.AuthRemote>(),
          gh<_i960.AuthMapper>(),
        ));
    gh.factory<_i458.GetPostUc>(
        () => _i458.GetPostUc(gh<_i221.PostRepository>()));
    gh.factory<_i333.GetListPostUc>(
        () => _i333.GetListPostUc(gh<_i221.PostRepository>()));
    gh.factory<_i799.LogoutUc>(
        () => _i799.LogoutUc(gh<_i189.AuthRepository>()));
    gh.factory<_i71.LoginUc>(() => _i71.LoginUc(gh<_i189.AuthRepository>()));
    gh.factory<_i1069.UpdatePasswordUc>(
        () => _i1069.UpdatePasswordUc(gh<_i189.AuthRepository>()));
    gh.factory<_i63.ForgotPasswordUc>(
        () => _i63.ForgotPasswordUc(gh<_i189.AuthRepository>()));
    gh.factory<_i1044.LoginGoogleUc>(
        () => _i1044.LoginGoogleUc(gh<_i189.AuthRepository>()));
    gh.factory<_i562.GetCurrentUserUc>(
        () => _i562.GetCurrentUserUc(gh<_i189.AuthRepository>()));
    gh.factory<_i242.UpdateFirstNameLastNameUc>(
        () => _i242.UpdateFirstNameLastNameUc(
              gh<_i397.UserRepository>(),
              gh<_i189.AuthRepository>(),
            ));
    gh.factory<_i540.RegisterUc>(() => _i540.RegisterUc(
          gh<_i189.AuthRepository>(),
          gh<_i397.UserRepository>(),
        ));
    gh.factory<_i209.SendEmailVerificationUc>(
        () => _i209.SendEmailVerificationUc(
              gh<_i189.AuthRepository>(),
              gh<_i397.UserRepository>(),
            ));
    gh.factory<_i437.UpdateEmailUc>(() => _i437.UpdateEmailUc(
          gh<_i189.AuthRepository>(),
          gh<_i397.UserRepository>(),
        ));
    return this;
  }
}

class _$InjectionModules extends _i981.InjectionModules {}
