import 'package:quiz/data/local/model/quiz_model.dart';

abstract class QuizEvent{}

class InsertQueEvent extends QuizEvent{
  QuizModel quiz;
  InsertQueEvent({required this.quiz});
}

class FetchQesAnsEvent extends QuizEvent{
  String cate;
  FetchQesAnsEvent({required this.cate});
}