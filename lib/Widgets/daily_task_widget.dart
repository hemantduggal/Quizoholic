import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spinmaster/Widgets/win_dialog.dart';
import '../Networking/web.dart';
import '../Variables/conn.dart';



class DailyTaskWidget extends StatefulWidget {
  final String refId;
  const DailyTaskWidget({Key? key, required this.refId}) : super(key: key);

  @override
  _DailyTaskWidgetState createState() => _DailyTaskWidgetState(refId);
}

class _DailyTaskWidgetState extends State<DailyTaskWidget> {
  final String refId;
  late String time="1",gifLink,title,coin,openLink;
  Color _color = Colors.lightBlue.shade100;
  List<Color> _color2List = [
    Colors.lightBlue.shade400,
    Colors.lightBlue.shade200
  ];

  _DailyTaskWidgetState(this.refId);

  int getRandomNumber(int max)
  {
    var rng = Random();
    for (var i = 0; i < 10; i++) {
      return rng.nextInt(max);

    }
    return rng.nextInt(max);
  }

  void setValues ()
  {
    setState(() {
      gifLink = adsBannerGif[Random().nextInt(adsBannerGif.length)];
      title = adsBannerTitle[Random().nextInt(adsBannerTitle.length)];
      time = dailyTaskTimeLimits[Random().nextInt(dailyTaskTimeLimits.length)];
      coin = (int.parse(time) * 200).toString();
      openLink = otherAdsLinksList[int.parse(refId) + 5];
    });
  }



  Future<void> launchLink(context)
  async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('taskDaily', DateTime.now().minute + int.parse(time));
    setState(() {
      onResumeWebsiteLink = openLink;
      onResumeAddCoins = coin;
      onResumeTaskNumber = refId;
    });

    launchURL(context, onResumeWebsiteLink);

  }


  void setColour()
  {
    if(taskOfferList.contains(refId)==true)
      {
        setState(() {
          _color = Colors.red.shade100;
          _color2List = [
            Colors.red.shade400,
            Colors.red.shade200
          ];
        });
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setValues();
    setColour();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: _color
        ),
        child: InkWell(
          onTap: (){
            if(taskOfferList.contains(refId)==false)
            {
              launchLink(context);
            }
            else
            {
              showLimitDialog(context);
            }
          },
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      height: 65,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(56),topRight: Radius.circular(100),topLeft: Radius.elliptical(200,50)),
                          gradient: LinearGradient(
                              begin: AlignmentDirectional.topCenter,
                              end: AlignmentDirectional.bottomCenter,
                              colors: _color2List
                          )
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [

                        Text("$time Min"),
                        Container(
                          height: 74,width: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Stack(
                            children:  [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                    image: AssetImage(gifLink),
                                  ),
                                ),
                              ),

                              const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text("Ad",style: TextStyle(fontSize: 10,color: Colors.black),),
                              )

                            ],
                          ),
                        ),


                      ],
                    ),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: MediaQuery.of(context).size.width/4,
                    child:  Text(title,style: const TextStyle(fontSize: 15),),
                  ),

                  const Spacer(),

                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: AlignmentDirectional.topCenter,
                                  end: AlignmentDirectional.bottomCenter,
                                  colors: [
                                    Colors.lightBlue.shade600,
                                    Colors.lightBlue.shade400
                                  ]
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Text(coin,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 15),),
                              const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Image(image: AssetImage("assets/images/dmg.png"),),
                              )
                            ],
                          ),
                        ),

                        Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: AlignmentDirectional.topCenter,
                                  end: AlignmentDirectional.bottomCenter,
                                  colors: [
                                    Colors.lightBlue.shade600,
                                    Colors.lightBlue.shade400
                                  ]
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("PLAY",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 15),),

                            ],
                          ),
                        )
                      ],
                    ),
                  )

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
