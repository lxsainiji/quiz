import 'package:quiz/data/local/model/quiz_model.dart';

abstract class QuizState{}

class QuizInitialState extends QuizState{}
class QuizLoadingState extends QuizState{}
class QuizSuccessState extends QuizState{}
class QuizFetchDataState extends QuizState{
  List<QuizModel> quizData;
  QuizFetchDataState({required this.quizData});
}
class QuizErrorState extends QuizState{
  String error;
  QuizErrorState({required this.error});
}
