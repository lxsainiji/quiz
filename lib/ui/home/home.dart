import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:quiz/ui/question/question.dart';
import 'package:quiz/utiles/Constants/app_const.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<String> categories =["Math","Gk","General Affairs","Geography"];
    TextEditingController searchController =TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 47,),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: SizedBox(
                width: 60,
                height: 60,
                child: ClipOval(
                  child: Image.network("https://cdni.iconscout.com/illustration/premium/thumb/female-user-image-illustration-download-in-svg-png-gif-file-formats--person-girl-business-pack-illustrations-6515859.png",fit: BoxFit.cover,),
                ),
              ),
              title: Text("Hi, " "Laxman",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              subtitle: Text("Ready to play",style: TextStyle(
                color: Colors.grey
              ),),
              trailing: SizedBox(
                width: 80,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 4),
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
                      Text(" 200",style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurple
                      ),)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 7,),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,size: 28,),
                  labelText: "Search for Quiz",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18
                  ),
                  border: InputBorder.none
                ),
              ),
            ),
            SizedBox(height: 20,),
            // ClipRRect( // Required for blur clipping
            //   borderRadius: BorderRadius.circular(10), // adjust if needed
            //   child: Stack(
            //     children: [
            //       // Background image
            //       Container(
            //         width: double.infinity,
            //         height: 160, // fixed height needed
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //             image: AssetImage("lib/assets/img/banner.png"),
            //             filterQuality: FilterQuality.none,
            //             fit: BoxFit.cover,
            //           ),
            //         ),
            //       ),
            //
            //       // Blur effect
            //       BackdropFilter(
            //         filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            //         child: Container(
            //           width: double.infinity,
            //           height: 160,
            //           color: Colors.black.withOpacity(0), // required
            //         ),
            //       ),
            //
            //       // Foreground content
            //       Container(
            //         width: double.infinity,
            //         height: 160,
            //         padding: const EdgeInsets.all(18),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               "Play and Win",
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 25,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //             Text(
            //               "Start a Quiz now & Enjoy",
            //               style: TextStyle(
            //                 fontSize: 16,
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //             SizedBox(height: 10,),
            //             SizedBox(
            //               width: 130,
            //               child: Container(
            //                 padding: EdgeInsets.symmetric(vertical: 4),
            //                 decoration: BoxDecoration(
            //                   color: Colors.white,
            //                   borderRadius: BorderRadius.circular(6)
            //                 ),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Text("Get Start",style: TextStyle(
            //                       color: Colors.black,
            //                       fontSize: 19,
            //                       fontWeight: FontWeight.w600
            //                     ),),
            //                     Icon(Icons.keyboard_arrow_right,color: Colors.black,)
            //                   ],
            //                 ),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Categories",style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600
                ),),
                Text("See all",style: TextStyle(
                    fontSize: 21,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600
                ),)
              ],
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                  itemBuilder: (_,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_){
                            return Question(cate: AppConst.CATE_LIST[index],);
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          width: 140,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade100,
                            borderRadius: BorderRadius.all(Radius.elliptical(12, 14))
                          ),
                            child: Center(
                              child: Text(categories[index],style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 22,
                                fontWeight: FontWeight.w600
                              ),),
                            ),
                        ),
                      ),
                    );
                  }
                  ),
            ),
            SizedBox(height: 15,),
            Text("Recent",style: TextStyle(
              fontSize: 21,
                fontWeight: FontWeight.w600
            ),),
            SizedBox(height: 5,),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 4,
                  itemBuilder: (_,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade100,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: ListTile(
                          minTileHeight: 80,
                          leading: Container(
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade200,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Icon(Icons.auto_graph_outlined,size: 30,color: Colors.deepPurple,),
                          ),
                          title: Text("Geography",style: TextStyle(
                            fontWeight: FontWeight.w600
                          ),),
                          subtitle: Text("12 Question",style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600
                          ),),
                          trailing: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text("Complete",style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
