import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/ui/home/home.dart';
import 'package:quiz/ui/intro/result/result.dart';
import 'package:quiz/ui/question/bloc/quiz_bloc.dart';
import 'package:quiz/ui/question/bloc/quiz_event.dart';
import 'package:quiz/ui/question/bloc/quiz_state.dart';

class Question extends StatefulWidget{
  String cate;
  Question({required this.cate});
  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  void initState() {
    super.initState();
    context.read<QuizBloc>().add(FetchQesAnsEvent(cate: widget.cate));
  }
  int? selectesVal;
  int QuestionNo = 0;
  List<int> Answers =[];
  int correctAns = 0;
  int wrongAns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocBuilder<QuizBloc,QuizState>(
          builder: (_,state) {
            if(state is QuizErrorState){
              return Center(child: CircularProgressIndicator(),);
            }
            if(state is QuizFetchDataState){

              List<String> options =[state.quizData[QuestionNo].op1,state.quizData[QuestionNo].op2,state.quizData[QuestionNo].op3,state.quizData[QuestionNo].op4,];
              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 45,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.5,color: Colors.black54),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Icon(Icons.chevron_left_outlined,size: 35,),
                              ),
                              SizedBox(width: 15,),
                              Text("Basic's Test",style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700
                              ),),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.access_time_outlined),
                              SizedBox(width: 10,),
                              Text("2:00",style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500
                              ),)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 25,),
                      Text("Question " "${QuestionNo+1}" " of " "${state.quizData.length}",style: TextStyle(
                          fontSize: 22,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w500
                      ),),
                      SizedBox(height: 6,),
                      Text("${state.quizData[QuestionNo].que}",style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      ),),
                      SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 4,
                            itemBuilder: (_,index){
                              return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1,color: Colors.grey),
                                      borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${options[index]}",style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w600
                                      ),),
                                      Radio<int>(
                                          value: index,
                                          groupValue: selectesVal,
                                          onChanged: (value){
                                            setState(() {
                                              selectesVal=value!;
                                            });
                                          }),
                                    ],
                                  )
                              );
                            }),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: QuestionNo==state.quizData.length-1 ? InkWell(
                      onTap: (){
                        Answers.add(selectesVal!);
                        if(state.quizData[QuestionNo].ans==selectesVal){
                          correctAns +=1;
                        }
                        else{
                          wrongAns +=1;
                        }
                        print(correctAns);
                        print(wrongAns);
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>Result(correct: correctAns,QueCount: state.quizData.length,)));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 40),
                        padding: EdgeInsets.symmetric(vertical: 13),
                        width:double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child:Text("Complete",textAlign: TextAlign.center,style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),),
                      ),
                    ) :InkWell(
                      onTap: (){
                        setState(() {
                          if(state.quizData[QuestionNo].ans==selectesVal){
                            correctAns +=1;
                          }
                          else{
                            wrongAns +=1;
                          }
                          QuestionNo +=1;
                          Answers.add(selectesVal!);
                          selectesVal=null;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 40),
                        padding: EdgeInsets.symmetric(vertical: 13),
                        width:double.infinity,
                        decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(8)
                        ),
                        child:Text("Next",textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                        ),),
                                          ),
                    )
                  )],
              );
            }
            if(state is QuizErrorState){
              return Center(child: Text(state.error),);
            }
            return Container();
          }
        )
      ),
    );
  }
}