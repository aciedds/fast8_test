import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:fast8_test/utils/hive_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fast8_test/utils/dio_utils.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectionModules {
  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  FirebaseFirestore get cloudFireStore => FirebaseFirestore.instance;

  @lazySingleton
  FirebaseApp get firebaseApp => Firebase.app();

  @lazySingleton
  @preResolve
  Future<Dio> client() async => DioUtils.client();

  @lazySingleton
  @preResolve
  Future<HiveUtils> get hive async => HiveUtils.instance();
}
