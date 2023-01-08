import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spinmaster/Variables/conn.dart';

import '../Networking/web.dart';

class PlayAndGetWidget extends StatefulWidget {
  const PlayAndGetWidget({Key? key}) : super(key: key);

  @override
  _PlayAndGetWidgetState createState() => _PlayAndGetWidgetState();
}

class _PlayAndGetWidgetState extends State<PlayAndGetWidget> {


  late String time,coin,openLink;

  void setValues ()
  {
    setState(() {
      coin = "200";
      time="2";
    });
  }

  Future<void> launchLink() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('taskDaily', DateTime.now().minute + int.parse(time));
    setState(() {
      onResumeWebsiteLink = openLink;
      onResumeAddCoins = coin;
      onResumeTaskNumber = "0";
    });

    launchURL(context, onResumeWebsiteLink);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setValues();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [

          for(int b=0;b<gameCategories.length;b++)
            Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 40,
                    color: Colors.pink.shade50,
                    child: Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: const Icon(Icons.videogame_asset,color: Colors.red,)),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(gameCategories[b],style: const TextStyle(fontSize: 18),),
                        ),

                        const Spacer(),

                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("View All",style: TextStyle(fontSize: 18),),
                        ),

                      ],
                    ),
                  ),
                ),

                for(int z=0;z<3;z++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [


                      for(int v=0;v<gameNumbers[z];v++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 160,
                            width: MediaQuery.of(context).size.width/2-50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.pink.shade200,
                                    Colors.pink.shade200,
                                    Colors.pink.shade200,
                                    Colors.pink.shade100
                                  ]
                              ),
                            ),
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  if(b==0)
                                  {
                                    openLink = otherAdsLinksList[20];
                                  }
                                  else if(b==1)
                                  {
                                    openLink = otherAdsLinksList[21];

                                  }
                                  else if(b==2)
                                  {
                                    openLink = otherAdsLinksList[22];

                                  }
                                  else if(b==3)
                                  {

                                    openLink = otherAdsLinksList[23];

                                  }
                                  else if(b==4)
                                  {
                                    openLink = otherAdsLinksList[29];

                                  }
                                  else if(b==5)
                                  {
                                    openLink = otherAdsLinksList[30];

                                  }
                                  else if(b==6)
                                  {
                                    openLink = otherAdsLinksList[31];

                                  }
                                  else if(b==7)
                                  {
                                    openLink = otherAdsLinksList[32];
                                  }
                                });
                                launchLink();
                              },
                              child: Stack(
                                children: [
                                  Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image(image: AssetImage(gamesIcons[Random().nextInt(gamesIcons.length)]),width: 60,)),

                                        Text(gameNames[Random().nextInt(gameNames.length)],style: const TextStyle(fontSize: 20,),),
                                        const Text("2 Min",style: TextStyle(fontSize: 13),),

                                        Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: const Center(child: Text("Play Now",style: TextStyle(color: Colors.white,fontSize: 16),),),
                                        )


                                      ],
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Row(
                                            children: const [
                                              Image(image: AssetImage("assets/images/diamond2.png"),width: 20,),
                                              Text("200",style: TextStyle(color: Colors.white),),
                                            ],
                                          ),
                                        ),
                                      ),

                                      const Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Text("Ad"),
                                      ),



                                    ],
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),

                      if(gameNumbers[z]==1)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 160,
                            width: MediaQuery.of(context).size.width/2-50,
                          ),
                        ),


                    ],
                  )

              ],
            ),
        ],
      ),
    );
  }
}
