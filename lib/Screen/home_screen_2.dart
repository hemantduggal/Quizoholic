import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spinmaster/Widgets/topbar2.dart';

import '../Networking/web.dart';
import '../UnityAds/unity_ads_init.dart';
import '../Variables/conn.dart';



class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {


  int newCoin =0;

  void fetchQuizListLocal(String table) async
  {
    var s = await fetchQuiz(table);
    setState(() {
      quizList = s.toString().trim().split('|');
    });
    Navigator.pushNamed(context, '/quizPlay');
  }


  void setValues(int diamond,int quiz) async
  {
    setState(() async {

      diamondLeft = await setCoins(diamond);
      quizLeft = await setQuiz(quiz);

      newCoin = diamondLeft;
    });
  }




  List<String> quizNames = ["dbms","it","network"];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    unityAdsInit();
    setValues(0,0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [

            TopBar2(title: "QuizoHolic"),

            Padding(
              padding: const EdgeInsets.only(top: 66,bottom: 0),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [


                  InkWell(
                    onTap: (){
                      fetchQuizListLocal("dbms");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade900,
                              Colors.blue
                            ]
                          ),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [

                            Image(image: AssetImage("assets/images/task.png"),height: 60,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Play DBMS Quiz",style: TextStyle(color: Colors.white,fontSize: 30),),
                            ),
                            Text("Play Quiz to get Rewards",style: TextStyle(color: Colors.white,fontSize: 20),),

                          ],
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      fetchQuizListLocal("it");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.blue.shade900,
                                  Colors.blue
                                ]
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [

                            Image(image: AssetImage("assets/images/task.png"),height: 60,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Play IT Quiz",style: TextStyle(color: Colors.white,fontSize: 30),),
                            ),
                            Text("Play Quiz to get Rewards",style: TextStyle(color: Colors.white,fontSize: 20),),

                          ],
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      fetchQuizListLocal("network");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.blue.shade900,
                                  Colors.blue
                                ]
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [

                            Image(image: AssetImage("assets/images/task.png"),height: 60,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Play Networking Quiz",style: TextStyle(color: Colors.white,fontSize: 30),),
                            ),
                            Text("Play Quiz to get Rewards",style: TextStyle(color: Colors.white,fontSize: 20),),

                          ],
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      fetchQuizListLocal(quizNames[Random().nextInt(3)]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.purple.shade900,
                                  Colors.purple
                                ]
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [

                            Image(image: AssetImage("assets/images/task.png"),height: 100,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Play Daily Quiz",style: TextStyle(color: Colors.white,fontSize: 30),),
                            ),
                            Text("Play Quiz to get Rewards",style: TextStyle(color: Colors.white,fontSize: 20),),

                          ],
                        ),
                      ),
                    ),
                  ),

                 /*Padding(
                   padding: const EdgeInsets.only(top: 25),
                   child: HomeWidget2(context,"Spin & Win","Spin go win more gems","assets/images/wel.png","SPIN","/spin",Colors.blue.shade900,Colors.blue.shade500,Colors.yellow.shade700,"Scratch & Win","Scratch & win more gems","assets/images/card.png","SCRATCH","/scratch",Colors.yellow.shade700,Colors.yellow.shade500,Colors.blue.shade500),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 15),
                   child: HomeWidget2(context,"Lucky Draw","Lucky Draw to get gems","assets/images/lucky.png","WIN","/moreCoin",Colors.orange.shade900,Colors.orange.shade500,Colors.cyan.shade700,"Task","Complete task to get gems","assets/images/task.png","TASK","/dailyTask",Colors.orange.shade900,Colors.orange.shade500,Colors.cyan.shade700,),
                 ),


                 Padding(
                   padding: const EdgeInsets.only(top: 15),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       InkWell(
                         onTap: (){
                           launchURL(context, otherAdsLinksList[34]);
                         },
                         child: Container(
                           height: 100,
                           width: MediaQuery.of(context).size.width/2-10,
                           child: Material(
                             elevation: 5,
                             borderRadius: BorderRadius.circular(8),
                             color: Colors.white,
                             child: Padding(
                               padding: const EdgeInsets.all(2.0),
                               child: Image(image: AssetImage("assets/images/yt.png"),),
                             ),
                           ),
                         ),
                       ),
                       InkWell(
                         onTap: (){
                           launchURL(context, otherAdsLinksList[35]);

                         },
                         child: Container(
                           height: 100,
                           width: MediaQuery.of(context).size.width/2-10,
                           child: Material(
                             elevation: 5,
                             borderRadius: BorderRadius.circular(8),
                             color: Colors.white,
                             child: Padding(
                               padding: const EdgeInsets.all(2.0),
                               child: Image(image: AssetImage("assets/images/tt.png"),),
                             ),
                           ),
                         ),
                       )
                     ],
                   ),
                 ),


                 Padding(
                   padding: const EdgeInsets.only(top: 20,left: 8,right: 8),
                   child: InkWell(
                     onTap: (){
                       Navigator.pushNamed(context, "/quiz");
                     },
                     child: Container(
                       height: 100,
                       decoration: BoxDecoration(
                         gradient: LinearGradient(
                           colors: [
                             Colors.blue,
                             Colors.blue.shade900
                           ]
                         ),
                         borderRadius: BorderRadius.circular(10)
                       ),

                       child: Stack(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [

                               Container(
                                 height: 100,
                                 width: MediaQuery.of(context).size.width/4.5,
                                 decoration: BoxDecoration(
                                     gradient: LinearGradient(
                                         colors: [
                                           Colors.lightBlue.shade300,
                                           Colors.lightBlue.shade500
                                         ],
                                     ),
                                     borderRadius: BorderRadius.only(topLeft: Radius.circular(100),bottomLeft: Radius.circular(100),topRight: Radius.circular(10), bottomRight: Radius.circular(10))
                                 ),
                               )

                             ],

                           ),

                           Center(
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Text("Offer and More",style: TextStyle(fontSize: 24,color: Colors.white),),
                                       Text("participate to get coins",style: TextStyle(fontSize: 15,color: Colors.white),),
                                     ],
                                   ),
                                 ),

                                 Padding(
                                   padding: const EdgeInsets.all(0.0),
                                   child:  Lottie.asset(
                                       'assets/lottie/44177-quiz.json',height:100),
                                 )

                               ],
                             ),
                           )

                         ],
                       ),

                     ),
                   ),
                 ),

                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: QurekaSquareBanner(height: 130),
                 ),

                  Padding(
                    padding: const EdgeInsets.only(top: 0,bottom: 20),
                    child: HomeWidget2(context,"Redeem Gems","Redeem gems instantly","assets/images/diamond2.png","REDEEM","/wallet",Colors.cyan.shade900,Colors.cyan.shade500,Colors.yellow.shade700,"Play & Earn","Play games to earn gems","assets/images/theme/ii8.png","PLAY","/play&Get",Colors.red.shade900,Colors.red.shade500,Colors.orange.shade500),
                  ),


*/
                ],),
            ),


            /*Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: (){
                          launchURL(context, otherAdsLinksList[15]);
                        },
                        child: Image(image: AssetImage("assets/images/cnn.png"),width: 60,)),

                    InkWell(
                        onTap: (){
                          launchURL(context, otherAdsLinksList[25]);
                        },
                        child: Image(image: AssetImage("assets/images/dn.png"),width: 50,)),

                  ],
                )
              ],
            ),
*/

          ],
        ),
      ),
    );
  }
}

