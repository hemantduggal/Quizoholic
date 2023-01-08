import 'dart:math';

import 'package:flutter/material.dart';

import '../Networking/web.dart';
import '../Variables/conn.dart';


class HomeBottomAds extends StatefulWidget {
  const HomeBottomAds({Key? key}) : super(key: key);

  @override
  _HomeBottomAdsState createState() => _HomeBottomAdsState();
}

class _HomeBottomAdsState extends State<HomeBottomAds> {
  late String bannerImg,bannerTitle,bannerDesc,bannerGif,adsCurrentLink;

  int getRandomNumber(int max)
  {
    var rng = Random();
    for (var i = 0; i < 10; i++) {
      // print(rng.nextInt(max));
      return rng.nextInt(max);

    }
    return rng.nextInt(max);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        launchURL(context, otherAdsLinksList[5]);
      },
      child: SizedBox(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    child:  const Image(image: AssetImage("assets/images/theme/bottomAds1.png"),fit: BoxFit.fill,)),



              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow.shade800,
                      borderRadius: BorderRadius.circular(2)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text("AD",style: TextStyle(fontSize: 10,color: Colors.white),),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
