import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee/marquee.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spinmaster/Widgets/win_dialog.dart';

import '../Networking/web.dart';
import '../Variables/conn.dart';

class MoreCoinsAppWidget extends StatefulWidget {
  final String refId,task,icon,title,description,link;
  const MoreCoinsAppWidget({Key? key, required this.refId, required this.title, required this.icon, required this.task,required this.description,required this.link}) : super(key: key);

  @override
  _MoreCoinsAppWidgetState createState() => _MoreCoinsAppWidgetState(refId,task,icon,title,description,link);
}

class _MoreCoinsAppWidgetState extends State<MoreCoinsAppWidget> {

  final String refId,task,icon,title,description,link;
  late String time="1",coin,openLink;
  Color _color = Colors.purple.shade50;

  _MoreCoinsAppWidgetState(this.refId,this.task, this.icon, this.title, this.description, this.link);


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
      coin = (int.parse(time) * 200).toString();
      openLink = adsMainLinks[Random().nextInt(adsMainLinks.length)];
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
    //print("containerrr" + taskOfferList[1] + " " + refId);

    if(taskOfferList.contains(refId)==true)
    {
      setState(() {
        _color = Colors.grey.shade200;
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


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 55,width: 55,
                      decoration: BoxDecoration(
                          color: Colors.purple.shade100,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Stack(
                        children:  [

                          if(task=="1")
                            Center(
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Image(
                                image: NetworkImage(icon),
                              ),
                            ),
                          )

                          else
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Lottie.asset("assets/lottie/18269-the-shining-trophy.json"),
                              ),
                            ),


                        ],
                      ),
                    ),
                  ),

                  const Spacer(),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.5,
                        height: 20,
                        child:  Marquee(text: title,style: const TextStyle(fontSize: 16),startAfter: const Duration(seconds: 2),scrollAxis: Axis.horizontal,blankSpace: 20),
                      ),

                      if(task=="1")
                      Row(
                        children: const [
                          Image(image: AssetImage("assets/images/starsmall.png"),width: 25,fit: BoxFit.cover,),
                          Image(image: AssetImage("assets/images/starsmall.png"),width: 25,fit: BoxFit.cover,),
                          Image(image: AssetImage("assets/images/starsmall.png"),width: 25,fit: BoxFit.cover,),
                          Image(image: AssetImage("assets/images/starsmall.png"),width: 25,fit: BoxFit.cover,),
                          Image(image: AssetImage("assets/images/starsmall.png"),width: 25,fit: BoxFit.cover,),
                        ],
                      )

                      else
                        SizedBox(
                            width: MediaQuery.of(context).size.width/2.5,
                            child: Text(description))

                    ],
                  ),

                  const Spacer(),

                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Container(
                          height: 30,
                          //width: 70,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: AlignmentDirectional.centerStart,
                                  end: AlignmentDirectional.centerEnd,
                                  colors: [
                                    Colors.purple.shade600,
                                    Colors.purple.shade300
                                  ]
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Image(image: AssetImage("assets/images/diamond2.png"),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(coin,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 15),),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: AlignmentDirectional.centerStart,
                                  end: AlignmentDirectional.centerEnd,
                                  colors: [
                                    Colors.purple.shade600,
                                    Colors.purple.shade300
                                  ]
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              if(task=="1")
                                const Text("Install",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 17),)
                              else
                                const Text("Visit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 17),),

      ],
                          ),
                        )
                      ],
                    ),
                  )

                ],
              ),

               Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text("Ad",style: TextStyle(fontSize: 10,color: Colors.purple),),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
