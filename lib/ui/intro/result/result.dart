import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/ui/home/home.dart';

class Result extends StatelessWidget{
  int correct;
  int QueCount;
  Result({required this.correct,required this.QueCount});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 20,),
                Image.asset("lib/assets/img/winner.png",),
                Text("Your Socre",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                ),),
                Text("$correct" "/" "$QueCount",style: TextStyle(
                    fontSize: 27,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 5,),
                Text("Congratulations!",style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 30,
                    fontWeight: FontWeight.w600
                ),),
                Text("Great Job," "Laxman" "You Have Done Well",style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),),
                SizedBox(height: 10,),
                SizedBox(
                  width: 170,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 4),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade100,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.pink.shade100,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Icon(Icons.diamond_outlined,color: Colors.pinkAccent.shade200,size: 22,)
                        ),
                        Text(" 200 Points",style: TextStyle(
                            fontSize: 20,
                            color: Colors.deepPurple
                        ),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 40),
                padding: EdgeInsets.symmetric(vertical: 13),
                width:double.infinity,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Home()));
                  },
                  child: Text("Back To Home",textAlign: TextAlign.center,style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}