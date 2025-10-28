import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz/data/local/model/quiz_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  DBHelper._();

  static DBHelper getInstance(){
    return  DBHelper._();
  }

  Database? DB;
  String TABLE_QUIZ ="quiz";
  static String COLUMN_QUE_ID="que_id";
  static String COLUMN_QUE="que";
  static String COLUMN_OP1="op1";
  static String COLUMN_OP2="op2";
  static String COLUMN_OP3="op3";
  static String COLUMN_OP4="op4";
  static String COLUMN_ANS="ans";
  static String COLUMN_CATE ="cate";


  Future<Database> initalDB()async{
    DB = DB ?? await openDb();
    return DB!;
  }

  Future<Database> openDb()async{
    Directory mDir =await getApplicationDocumentsDirectory();
    String mPath =join(mDir.path,"quiz.db");
    return await openDatabase(mPath,version: 1,onCreate: (db,version){
      db.execute("CREATE TABLE $TABLE_QUIZ ($COLUMN_QUE_ID INTEGER PRIMARY KEY AUTOINCREMENT,$COLUMN_QUE TEXT,$COLUMN_OP1 TEXT, $COLUMN_OP2 TEXT,$COLUMN_OP3 TEXT,$COLUMN_OP4 TEXT,$COLUMN_ANS INTEGER,$COLUMN_CATE TEXT)");
      }
    );
  }

  Future<bool> insertQue({required QuizModel quiz})async{
    var db=await initalDB();
    var check =await db.insert(TABLE_QUIZ, quiz.toMap());
    return check > 0;
  }
  
  Future<List<QuizModel>> getAllQuestions({required String cate})async{
    var db =await initalDB();
    List<Map<String,dynamic>> mData =await db.query(TABLE_QUIZ,where: "$COLUMN_CATE = ?",whereArgs: [cate]);

    return mData.map((map) => QuizModel.fromMap(map)).toList();
  }
}