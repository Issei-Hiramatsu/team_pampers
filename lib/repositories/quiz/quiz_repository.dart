import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_pampers/models/quiz_data.dart';

abstract class QuizRepository {
  User? get currentUser;

  Future<List<QuizData>> fetchQuiz();
}
