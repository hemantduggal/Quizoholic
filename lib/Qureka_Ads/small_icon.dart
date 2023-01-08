import 'dart:math';

import 'package:flutter/material.dart';

import '../Networking/web.dart';
import '../Variables/conn.dart';


class QurekaSmallIcon extends StatefulWidget {
  final double width;
  final int linkNumber;
  const QurekaSmallIcon({Key? key, required this.width, required this.linkNumber}) : super(key: key);

  @override
  _QurekaSmallIconState createState() => _QurekaSmallIconState(width,linkNumber);
}

class _QurekaSmallIconState extends State<QurekaSmallIcon> {
  final double width;
  final int linkNumber;

  String smallGif="",adsCurrentLink="";

  _QurekaSmallIconState(this.width, this.linkNumber);

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
      smallGif = adsBannerGif[getRandomNumber(adsBannerGif.length)];
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setValues();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          adsCurrentLink = otherAdsLinksList[linkNumber];
        });
        launchURL(context, adsCurrentLink);
      },
      child: Stack(
        children: [
          Image(image: AssetImage(smallGif,),width: width,),
          Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: const Padding(
                padding: EdgeInsets.all(1.0),
                child: Text("Ad",style: TextStyle(fontSize: 6,color: Colors.white),),
              ))
        ],
      ),
    );
  }
}



