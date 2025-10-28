import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/data/local/database/db_helper.dart';
import 'package:quiz/data/local/repository/quiz_repo.dart';
import 'package:quiz/ui/intro/intro.dart';
import 'package:quiz/ui/intro/result/result.dart';
import 'package:quiz/ui/question/bloc/quiz_bloc.dart';
import 'package:quiz/ui/question/question.dart';

void main(){
  runApp(BlocProvider(create: (_)=>QuizBloc(quizRepo: QuizRepository(mDB: DBHelper.getInstance())),child: MyApp(),));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Intro(),
    );
  }
}