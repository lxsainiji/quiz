import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/data/local/model/quiz_model.dart';
import 'package:quiz/data/local/repository/quiz_repo.dart';
import 'package:quiz/ui/question/bloc/quiz_event.dart';
import 'package:quiz/ui/question/bloc/quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent,QuizState>{
  QuizRepository quizRepo;
  QuizBloc({required this.quizRepo}):super(QuizInitialState()){
   on<InsertQueEvent>((event,emit)async{
     emit(QuizLoadingState());
     QuizModel quiz;
     int result =await  quizRepo.insertQueRepo(event.quiz);

     if(result==1){
       emit(QuizSuccessState());
     }else{
       emit(QuizErrorState(error: "Data not Inserted"));
     }
   });

   on<FetchQesAnsEvent>((event,emit)async{
     emit(QuizInitialState());

     var Data =await quizRepo.getAllQuesRepo(cate: event.cate);

     if(Data.isNotEmpty){
       emit(QuizFetchDataState(quizData: Data));
     }
     else{
       emit(QuizErrorState(error: "Data Not Found"));
     }
   });
  }
}