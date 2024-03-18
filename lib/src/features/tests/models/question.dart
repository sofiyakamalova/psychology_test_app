import 'package:psychology_test_app/src/features/tests/models/question_status.dart';

class Question {
  final String shkala;
  final String questionText;
  QuestionStatus status;

  Question(this.shkala, this.questionText,
      {this.status = QuestionStatus.NotReached});
}
