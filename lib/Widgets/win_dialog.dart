import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spinmaster/Networking/web.dart';
import 'package:spinmaster/UnityAds/unity_ads_init.dart';

import '../Variables/conn.dart';


void deleteValue()
{
  onResumeWebsiteLink = "";
  onResumeAddCoins = "0";
  onResumeTaskNumber = "0";
}


Future<Object?> showWinDialog(context,String coin)
{
  return showGeneralDialog(
    context: context,
    barrierColor: Colors.black38,
    barrierLabel: 'Label',
    barrierDismissible: false,
    pageBuilder: (_, __, ___) => WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Container(
            width: MediaQuery.of(context).size.width-90,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade900,
                    Colors.purple.shade500,
                    Colors.purple.shade900
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white,width: 2)
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LottieBuilder.asset("assets/lottie/18269-the-shining-trophy.json",height: 100,),

                  SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("\nCongratulation..\nyou Win $coin Coins",style: const TextStyle(fontSize: 20,color: Colors.white),),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                              loadUnityReward();
                            },
                            child: Container(
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightBlue.shade300,
                                      Colors.lightBlue.shade500,
                                      Colors.blue.shade900
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.white,width: 2)

                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 18),),),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}




Future<Object?> showTimeLeftDialog(context,String minute,String link)
{

  return showGeneralDialog(
    context: context,
    barrierColor: Colors.black38,
    barrierLabel: 'Label',
    barrierDismissible: false,
    pageBuilder: (_, __, ___) => WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Container(
          width: MediaQuery.of(context).size.width-90,
          height: MediaQuery.of(context).size.height/2-40,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple.shade900,
                  Colors.purple.shade500,
                  Colors.purple.shade900
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white,width: 2)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LottieBuilder.asset("assets/lottie/94122-time-hourglass.json",width: 50,),

                SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("\nOops..\n$minute Minute left\nplease go back",style: const TextStyle(fontSize: 20,color: Colors.white),),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: (){
                        deleteValue();
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/popup');
                      },
                      child: Container(
                        //height: 40,
                        //width: 120,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.red.shade300,
                                Colors.red.shade500,
                                Colors.red.shade900
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white,width: 2)

                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(child: Text("Exit",style: TextStyle(color: Colors.white,fontSize: 18),),),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        launchURL(context, link);
                      },
                      child: Container(
                        //height: 40,
                        //width: 120,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.lightBlue.shade300,
                                Colors.lightBlue.shade500,
                                Colors.blue.shade900
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white,width: 2)

                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 18),),),
                        ),
                      ),
                    ),
                  )
                ],)

              ],
            ),
          ),
        ),
      ),
    ),
  );
}




Future<Object?> showTimeLeftDialog2(context,String minute,String link)
{
  return showGeneralDialog(
    context: context,
    barrierColor: Colors.black38,
    barrierLabel: 'Label',
    barrierDismissible: false,
    pageBuilder: (_, __, ___) => WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Container(
          width: MediaQuery.of(context).size.width-90,
          height: MediaQuery.of(context).size.height/2-40,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple.shade900,
                  Colors.purple.shade500,
                  Colors.purple.shade900
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white,width: 2)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LottieBuilder.asset("assets/lottie/94122-time-hourglass.json",width: 50,),

                SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                       Text("\nOops..\nTask Incomplete\nplease go back",style: TextStyle(fontSize: 20,color: Colors.white),),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: (){
                          deleteValue();
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/popup');
                        },
                        child: Container(

                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.red.shade300,
                                  Colors.red.shade500,
                                  Colors.red.shade900
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white,width: 2)

                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(child: Text("Exit",style: TextStyle(color: Colors.white,fontSize: 18),),),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                          launchURL(context, link);
                        },
                        child: Container(

                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.lightBlue.shade300,
                                  Colors.lightBlue.shade500,
                                  Colors.blue.shade900
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white,width: 2)

                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 18),),),
                          ),
                        ),
                      ),
                    )
                  ],)

              ],
            ),
          ),
        ),
      ),
    ),
  );
}







Future<Object?> showLimitDialog(context)
{
  return showGeneralDialog(
    context: context,
    barrierColor: Colors.black38,
    barrierLabel: 'Label',
    barrierDismissible: false,
    pageBuilder: (_, __, ___) => Center(
      child: Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Container(
          width: MediaQuery.of(context).size.width-90,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple.shade900,
                  Colors.purple.shade500,
                  Colors.purple.shade900
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white,width: 2)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LottieBuilder.asset("assets/lottie/18269-the-shining-trophy.json",height: 90,),

                SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child: Text("\nOops..\nToday's Limit Reached \nTry Again Tomorrow",style: TextStyle(fontSize: 18,color: Colors.white),)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                            loadUnityInter();
                          },
                          child: Container(
                            height: 30,
                            width: 120,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.lightBlue.shade300,
                                    Colors.lightBlue.shade500,
                                    Colors.blue.shade900
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.white,width: 2)

                            ),
                            child: const Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 18),),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    ),
  );
}