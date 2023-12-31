import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/models/user_data.dart';
import 'package:team_pampers/repositories/auth/auth_repository.dart';
import 'package:team_pampers/utils/utils.dart';

final authRepositoryImplProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(
    ref.watch(authProvider),
    ref.watch(firestoreProvider),
  ),
);

final authUserProvider = StreamProvider<User?>(
  (ref) => ref.watch(authRepositoryImplProvider).authStateChanges(),
);

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._auth, this._firestore);
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  @override
  Future<String?> signUp({
    required UserData userData,
    required String password,
  }) async {
    final createdAtTimestamp = Timestamp.fromDate(DateTime.now());
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: userData.email,
      password: password,
    );
    await _firestore.collection('users').doc(userCredential.user?.uid).set(
          UserData(
            email: userData.email,
            userName: userData.userName,
            createdAt: createdAtTimestamp
          ).toJson(),
        );
    return userCredential.user?.uid;
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
