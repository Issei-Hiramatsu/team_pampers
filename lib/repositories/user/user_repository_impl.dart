import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/models/user_data.dart';
import 'package:team_pampers/repositories/user/user_repository.dart';
import 'package:team_pampers/utils/utils.dart';

final userRepositoryImplProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(
    ref.watch(authProvider),
    ref.watch(firestoreProvider),
    ref.watch(storageProvider),
  ),
);

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(
    this._auth,
    this._firestore,
    this._storage,
  );

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<List<UserData>> fetchUsersData() async {
    final response = await _firestore
        .collection('users')
        .orderBy(descending: true, 'score')
        .get();
    final list = <UserData>[];

    for (final document in response.docs) {
      final data = UserData.fromJson(document.data());
      list.add(data);
    }
    return list;
  }

  @override
  Future<UserData?> fetchUserData() async {
    final uid = currentUser!.uid;
    final response = await _firestore.collection('users').doc(uid).get();
    return UserData.fromJson(response.data()!);
  }

  @override
  Future<void> updateUserData({
    required File? file,
    required int? score,
  }) async {
    final uid = currentUser!.uid;
    if (file != null || score != null) {
      const fileName = 'profile_icon_image.jpg';
      final reference = _storage.ref().child('users/$uid/$fileName');
      final imageUrl = await reference.getDownloadURL();
      await _firestore.collection('users').doc(uid).update({
        'score': score,
        'imageUrl': imageUrl,
      });
    }
  }
}
