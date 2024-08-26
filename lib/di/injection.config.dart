// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:fast8_test/data/repository/auth_repository_impl.dart' as _i65;
import 'package:fast8_test/data/repository/personal_information_repository_impl.dart'
    as _i758;
import 'package:fast8_test/data/repository/user_repository_impl.dart' as _i205;
import 'package:fast8_test/data/source/auth_remote_source.dart' as _i310;
import 'package:fast8_test/data/source/personal_information_local_source.dart'
    as _i643;
import 'package:fast8_test/data/source/user_remote_source.dart' as _i692;
import 'package:fast8_test/di/modules/injection_modules.dart' as _i371;
import 'package:fast8_test/domain/mapper/auth_mapper.dart' as _i606;
import 'package:fast8_test/domain/mapper/user_mapper.dart' as _i481;
import 'package:fast8_test/domain/repository/auth_repository.dart' as _i315;
import 'package:fast8_test/domain/repository/personal_information_repository.dart'
    as _i99;
import 'package:fast8_test/domain/repository/user_repository.dart' as _i155;
import 'package:fast8_test/domain/usecase/add_address_uc.dart' as _i54;
import 'package:fast8_test/domain/usecase/add_biodata_uc.dart' as _i943;
import 'package:fast8_test/domain/usecase/add_company_uc.dart' as _i39;
import 'package:fast8_test/domain/usecase/add_user_data_uc.dart' as _i357;
import 'package:fast8_test/domain/usecase/check_user_email_exist_uc.dart'
    as _i239;
import 'package:fast8_test/domain/usecase/forgot_password_uc.dart' as _i23;
import 'package:fast8_test/domain/usecase/get_address_uc.dart' as _i974;
import 'package:fast8_test/domain/usecase/get_biodata_uc.dart' as _i716;
import 'package:fast8_test/domain/usecase/get_company_uc.dart' as _i54;
import 'package:fast8_test/domain/usecase/get_current_user_uc.dart' as _i290;
import 'package:fast8_test/domain/usecase/get_user_data_uc.dart' as _i748;
import 'package:fast8_test/domain/usecase/login_google_uc.dart' as _i989;
import 'package:fast8_test/domain/usecase/login_uc.dart' as _i784;
import 'package:fast8_test/domain/usecase/logout_uc.dart' as _i471;
import 'package:fast8_test/domain/usecase/register_uc.dart' as _i104;
import 'package:fast8_test/domain/usecase/send_email_verification_uc.dart'
    as _i841;
import 'package:fast8_test/domain/usecase/update_email_uc.dart' as _i967;
import 'package:fast8_test/domain/usecase/update_name_uc.dart' as _i758;
import 'package:fast8_test/domain/usecase/update_password_uc.dart' as _i1040;
import 'package:fast8_test/utils/dialog_utils.dart' as _i161;
import 'package:fast8_test/utils/hive_utils.dart' as _i1022;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:get_it/get_it.dart' as _i174;
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
    gh.factory<_i161.DialogUtils>(() => _i161.DialogUtils());
    gh.singleton<_i59.FirebaseAuth>(() => injectionModules.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
        () => injectionModules.cloudFireStore);
    gh.lazySingleton<_i982.FirebaseApp>(() => injectionModules.firebaseApp);
    await gh.lazySingletonAsync<_i1022.HiveUtils>(
      () => injectionModules.hive,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i361.Dio>(
      () => injectionModules.client(),
      preResolve: true,
    );
    gh.lazySingleton<_i606.AuthMapper>(() => _i606.AuthMapper());
    gh.lazySingleton<_i481.UserMapper>(() => _i481.UserMapper());
    gh.lazySingleton<_i310.AuthRemote>(
        () => _i310.AuthRemote(gh<_i59.FirebaseAuth>()));
    gh.lazySingleton<_i692.UsersRemote>(
        () => _i692.UsersRemote(gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i643.PersonalInformationLocalSource>(
        () => _i643.PersonalInformationLocalSource(gh<_i1022.HiveUtils>()));
    gh.lazySingleton<_i99.PersonalInformationRepository>(() =>
        _i758.PersonalInformationRepositoryImpl(
            gh<_i643.PersonalInformationLocalSource>()));
    gh.lazySingleton<_i315.AuthRepository>(() => _i65.AuthRepositoryImpl(
          gh<_i310.AuthRemote>(),
          gh<_i606.AuthMapper>(),
        ));
    gh.factory<_i54.AddAddressUc>(
        () => _i54.AddAddressUc(gh<_i99.PersonalInformationRepository>()));
    gh.factory<_i716.GetBiodataUc>(
        () => _i716.GetBiodataUc(gh<_i99.PersonalInformationRepository>()));
    gh.factory<_i54.GetCompanyUc>(
        () => _i54.GetCompanyUc(gh<_i99.PersonalInformationRepository>()));
    gh.factory<_i39.AddCompanyUc>(
        () => _i39.AddCompanyUc(gh<_i99.PersonalInformationRepository>()));
    gh.factory<_i974.GetAddressUc>(
        () => _i974.GetAddressUc(gh<_i99.PersonalInformationRepository>()));
    gh.factory<_i943.AddBiodataUc>(
        () => _i943.AddBiodataUc(gh<_i99.PersonalInformationRepository>()));
    gh.factory<_i471.LogoutUc>(
        () => _i471.LogoutUc(gh<_i315.AuthRepository>()));
    gh.factory<_i784.LoginUc>(() => _i784.LoginUc(gh<_i315.AuthRepository>()));
    gh.factory<_i1040.UpdatePasswordUc>(
        () => _i1040.UpdatePasswordUc(gh<_i315.AuthRepository>()));
    gh.factory<_i23.ForgotPasswordUc>(
        () => _i23.ForgotPasswordUc(gh<_i315.AuthRepository>()));
    gh.factory<_i989.LoginGoogleUc>(
        () => _i989.LoginGoogleUc(gh<_i315.AuthRepository>()));
    gh.lazySingleton<_i155.UserRepository>(() => _i205.UserRepositoryImpl(
          gh<_i692.UsersRemote>(),
          gh<_i481.UserMapper>(),
        ));
    gh.factory<_i104.RegisterUc>(() => _i104.RegisterUc(
          gh<_i315.AuthRepository>(),
          gh<_i155.UserRepository>(),
        ));
    gh.factory<_i841.SendEmailVerificationUc>(
        () => _i841.SendEmailVerificationUc(
              gh<_i315.AuthRepository>(),
              gh<_i155.UserRepository>(),
            ));
    gh.factory<_i967.UpdateEmailUc>(() => _i967.UpdateEmailUc(
          gh<_i315.AuthRepository>(),
          gh<_i155.UserRepository>(),
        ));
    gh.factory<_i290.GetCurrentUserUc>(() => _i290.GetCurrentUserUc(
          gh<_i315.AuthRepository>(),
          gh<_i155.UserRepository>(),
        ));
    gh.factory<_i239.CheckUserEmailExistUc>(
        () => _i239.CheckUserEmailExistUc(gh<_i155.UserRepository>()));
    gh.factory<_i748.GetUserDataUc>(
        () => _i748.GetUserDataUc(gh<_i155.UserRepository>()));
    gh.factory<_i357.AddUserDataUc>(
        () => _i357.AddUserDataUc(gh<_i155.UserRepository>()));
    gh.factory<_i758.UpdateNameUc>(() => _i758.UpdateNameUc(
          gh<_i155.UserRepository>(),
          gh<_i315.AuthRepository>(),
        ));
    return this;
  }
}

class _$InjectionModules extends _i371.InjectionModules {}
