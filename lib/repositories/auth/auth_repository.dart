import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_pampers/models/user_data.dart';

abstract class AuthRepository {
  User? get currentUser;
  Stream<User?> authStateChanges();

  Future<String?> signUp({
    required UserData userData,
    required String password,
  });

  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<void> sendPasswordResetEmail({
    required String email,
  });

  Future<void> signOut();
}
