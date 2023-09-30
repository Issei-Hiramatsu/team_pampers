import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/models/quiz_data.dart';
import 'package:team_pampers/repositories/quiz/quiz_repository.dart';
import 'package:team_pampers/utils/utils.dart';

final quizRepositoryImplProvider = Provider<QuizRepository>(
  (ref) => QuizRepositoryImpl(
    ref.watch(authProvider),
    ref.watch(firestoreProvider),
  ),
);

class QuizRepositoryImpl implements QuizRepository {
  QuizRepositoryImpl(this._auth, this._firestore);
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  @override
  Future<List<QuizData>> fetchQuiz() async {
    final response = await _firestore.collection('question').get();
    final list = <QuizData>[];
    for (final document in response.docs) {
      final data = QuizData.fromJson(document.data());
      list.add(data);
    }

    return list;
  }
}
