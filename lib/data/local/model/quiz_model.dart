import 'package:quiz/data/local/database/db_helper.dart';

class QuizModel{
   int? que_id;
   String que;
   String op1;
   String op2;
   String op3;
   String op4;
   int ans;
   String cate;
   QuizModel({this.que_id,required this.que,required this.op1,required this.op2,required this.op3,required this.op4,required this.ans,required this.cate});

   Map<String,dynamic> toMap(){
      return {
        DBHelper.COLUMN_QUE:que,
        DBHelper.COLUMN_OP1:op1,
        DBHelper.COLUMN_OP2:op2,
        DBHelper.COLUMN_OP3:op3,
        DBHelper.COLUMN_OP4:op4,
        DBHelper.COLUMN_ANS:ans,
        DBHelper.COLUMN_CATE:cate
      };
   }

   factory QuizModel.fromMap(Map<String,dynamic> map){
     return QuizModel(
     que_id: map[DBHelper.COLUMN_QUE_ID],
     que: map[DBHelper.COLUMN_QUE],
     op1: map[DBHelper.COLUMN_OP1],
     op2: map[DBHelper.COLUMN_OP2],
     op3: map[DBHelper.COLUMN_OP3],
     op4: map[DBHelper.COLUMN_OP4],
     ans: map[DBHelper.COLUMN_ANS],
         cate: map[DBHelper.COLUMN_CATE]
     );
   }
}