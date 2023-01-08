import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Networking/web.dart';
import '../Variables/conn.dart';


class QuizGameAds extends StatefulWidget {
  final String title;
  final int linkNumber;
  const QuizGameAds({Key? key, required this.title, required this.linkNumber}) : super(key: key);

  @override
  _QuizGameAdsState createState() => _QuizGameAdsState(title,linkNumber);
}

class _QuizGameAdsState extends State<QuizGameAds> {
  final String title;
  final int linkNumber;

  _QuizGameAdsState(this.title, this.linkNumber);


  int getRandomNumber(int max)
  {
    var rng = Random();
    for (var i = 0; i < 10; i++) {
      return rng.nextInt(max);

    }
    return rng.nextInt(max);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        launchURL(context,otherAdsLinksList[linkNumber]);
      },
      child: Stack(
        children: [



          Container(
            height: 80,
            width: MediaQuery.of(context).size.width-50,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue.shade900,
                  Colors.lightBlue.shade500,
                  Colors.blue.shade900,

                ]),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: LottieBuilder.asset("assets/lottie/18269-the-shining-trophy.json"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(title,style: const TextStyle(color: Colors.white,fontSize: 25),),
                ),

                const Spacer(),

                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(CupertinoIcons.arrowshape_turn_up_right_fill,color: Colors.white,),
                )
              ],
            ),
          ),

          Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: const Padding(
                padding: EdgeInsets.all(1.0),
                child: Text("Ad",style: TextStyle(fontSize: 8,color: Colors.white),),
              )),
        ],
      ),
    );
  }
}
