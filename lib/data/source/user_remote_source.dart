import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast8_test/data/model/user_model/user_model.dart';
import 'package:fast8_test/state/data_state/data_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UsersRemote {
  final FirebaseFirestore _fireStore;

  UsersRemote(this._fireStore);

  Future<DataState<UserModel>> getUserData(String uid) async {
    try {
      final result = await _fireStore.collection('users').doc(uid).get();
      if (result.data() != null) {
        return DataState.success(data: UserModel.fromJson(result.data()!));
      } else {
        return const DataState.error(message: "There is no user found");
      }
    } catch (e) {
      return DataState.error(message: "Error: $e");
    }
  }

  Future<DataState<UserModel>> addUserData({
    required UserModel model,
  }) async {
    try {
      await _fireStore.collection('users').doc(model.id).set(model.toJson());
      return DataState.success(data: model);
    } catch (e) {
      return DataState.error(message: "Error: $e");
    }
  }

  Future<DataState<bool>> updateName({
    required String id,
    required String name,
  }) async {
    try {
      await _fireStore.collection('users').doc(id).update({
        'name': name,
      });
      return const DataState.success(data: true);
    } catch (e) {
      return DataState.error(message: "Error: $e");
    }
  }

  Future<DataState<bool>> updateEmail({
    required String id,
    required String email,
  }) async {
    try {
      await _fireStore.collection('users').doc(id).update({
        'email': email,
      });
      return const DataState.success(data: true);
    } catch (e) {
      return DataState.error(message: "Error: $e");
    }
  }

  Future<DataState<bool>> updateVerifyEmail({
    required String id,
    required bool isEmailVerified,
  }) async {
    try {
      await _fireStore.collection('users').doc(id).update({
        'isEmailVerified': isEmailVerified,
      });
      return const DataState.success(data: true);
    } catch (e) {
      return DataState.error(message: "Error: $e");
    }
  }

  Stream<DataState<List<UserModel>>> getAllUsersStream({
    String? firstName,
    String? lastName,
    String? email,
    bool? isEmailVerified,
  }) async* {
    try {
      Query query = FirebaseFirestore.instance.collection('users');

      if (firstName != null && firstName.isNotEmpty) {
        query = query.where('firstName', isEqualTo: firstName);
      }
      if (lastName != null && lastName.isNotEmpty) {
        query = query.where('lastName', isEqualTo: lastName);
      }
      if (email != null && email.isNotEmpty) {
        query = query.where('email', isEqualTo: email);
      }
      if (isEmailVerified != null) {
        query = query.where('isEmailVerified', isEqualTo: isEmailVerified);
      }

      final result = query.snapshots();
      yield* result.map(
        (event) => DataState.success(
          data: event.docs
              .map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
              .toList(),
        ),
      );
    } catch (e) {
      yield DataState.error(message: "Error: $e");
    }
  }

  Future<DataState<bool>> checkUserEmailExist({
    required String email,
  }) async {
    try {
      Query query = _fireStore.collection('users').where(
            'email',
            isEqualTo: email,
          );

      final result = await query.get();
      if (result.docs.isNotEmpty) {
        return const DataState.success(
          data: true,
        );
      } else {
        return const DataState.error(message: "There is no user found");
      }
    } catch (e) {
      return DataState.error(message: "Error: $e");
    }
  }
}
