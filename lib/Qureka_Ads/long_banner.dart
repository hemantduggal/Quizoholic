import 'dart:math';
import 'package:flutter/material.dart';

import '../Networking/web.dart';
import '../Variables/conn.dart';



class QurekaLongBanner extends StatefulWidget {
  const QurekaLongBanner({Key? key}) : super(key: key);

  @override
  _QurekaLongBannerState createState() => _QurekaLongBannerState();
}

class _QurekaLongBannerState extends State<QurekaLongBanner> {

  String bannerImg="",adsCurrentLink="";

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
      bannerImg = adsLongBannerImages[getRandomNumber(adsLongBannerImages.length)];

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
    return  InkWell(
      onTap: ()
      {
        setState(() {
          adsCurrentLink = adsMainLinks[getRandomNumber(adsMainLinks.length)];
        });
        launchURL(context, adsCurrentLink);
      },
      child: Stack(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width/2-30,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent
            ),
            child: ClipRRect(child: Image(image: AssetImage(bannerImg,),fit: BoxFit.cover,),borderRadius: BorderRadius.circular(10)),),

          Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: const Padding(
                padding: EdgeInsets.all(1.0),
                child: Text("Ad",style: TextStyle(fontSize: 8,color: Colors.white),),
              ))
        ],
      ),
    );
  }
}



