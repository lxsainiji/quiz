import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/data/local/model/quiz_model.dart';
import 'package:quiz/ui/home/home.dart';
import 'package:quiz/ui/question/bloc/quiz_bloc.dart';
import 'package:quiz/ui/question/bloc/quiz_event.dart';
import 'package:quiz/ui/question/bloc/quiz_state.dart';
import 'package:quiz/ui/question/question.dart';
import 'package:quiz/utiles/Constants/app_const.dart';

class Intro extends StatelessWidget{
  bool isLoading =false;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
             decoration: BoxDecoration(
                 color: Colors.black,
                 borderRadius: BorderRadius.circular(10)
             ),
             child: InkWell(
               onTap: (){
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Home()));
               },
               child: Text("Start",style: TextStyle(
                   color: Colors.white,
                   fontSize: 30,
                   fontWeight: FontWeight.w600
               ),),
             ),
           ),
           SizedBox(height: 25,),
           Container(
             padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
             decoration: BoxDecoration(
                 color: Colors.red.shade200,
                 borderRadius: BorderRadius.circular(10)
             ),
             child: BlocConsumer<QuizBloc,QuizState>(
               listener: (_,state){
                 if(state is QuizLoadingState){
                   isLoading=true;
                 }
                 if(state is QuizSuccessState){
                   isLoading=false;
                 }
                 if(state is QuizErrorState){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${state.error}")));
                 }
               },
               builder: (_,state) {
                 return InkWell(
                   onTap: (){
                     QuizModel addQue =QuizModel(
                         que: "Who wrote the national anthem of India?",
                         op1: "Rabindranath Tagore",
                         op2: "Bankim Chandra Chatterjee",
                         op3: "Sarojini Naidu",
                         op4: "Subhash Chandra Bose",
                         ans: 0,
                         cate:AppConst.CATE_GEN_AFF
                     );
                     context.read<QuizBloc>().add(InsertQueEvent(quiz: addQue));
                   },
                   child: isLoading ? Row(
                     children: [
                       Text("Add Que..",style: TextStyle(
                           color: Colors.green.shade500,
                           fontSize: 30,
                           fontWeight: FontWeight.w600
                       ),),
                       CircularProgressIndicator()
                     ],
                   ): Text("Add Que",style: TextStyle(
                       color: Colors.red.shade500,
                       fontSize: 30,
                       fontWeight: FontWeight.w600
                   ),),
                 );
               }
             ),
           ),
         ],
       )
     ),
   );
  }
}