import 'package:quiz/data/local/database/db_helper.dart';
import 'package:quiz/data/local/model/quiz_model.dart';

class QuizRepository{
  DBHelper mDB;
  QuizRepository({required this.mDB});

  Future<int> insertQueRepo(QuizModel quiz)async{
    if(await mDB.insertQue(quiz: quiz)){
      return 1;///Success
    }
    else{
      return 2;///Failure
    }
  }

  Future<List<QuizModel>> getAllQuesRepo({required String cate}){
    return mDB.getAllQuestions(cate: cate);
  }
}