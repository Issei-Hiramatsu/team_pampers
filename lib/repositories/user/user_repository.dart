import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_pampers/models/user_data.dart';

abstract class UserRepository {
  User? get currentUser;

  Future<List<UserData>> fetchUsersData();
  Future<UserData?> fetchUserData();

  Future<void> updateUserData({
    required File? file,
  });
}
