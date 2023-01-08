import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../Networking/web.dart';
import '../Variables/conn.dart';


class QurekaSquareBanner extends StatefulWidget {
  final double height;
  const QurekaSquareBanner({Key? key, required this.height}) : super(key: key);

  @override
  _QurekaSquareBannerState createState() => _QurekaSquareBannerState(height);
}

class _QurekaSquareBannerState extends State<QurekaSquareBanner> {
  late String bannerImg,bannerTitle,bannerDesc,bannerGif,adsCurrentLink;
  final double height;

  _QurekaSquareBannerState(this.height);

  int getRandomNumber(int max)
  {
    var rng = Random();
    for (var i = 0; i < 10; i++) {
     // print(rng.nextInt(max));
      return rng.nextInt(max);

    }
    return rng.nextInt(max);
  }

  void setValues ()
  {

    setState(() {
      bannerGif = adsBannerGif[getRandomNumber(adsBannerGif.length)];
      bannerImg = adsBannerImages[getRandomNumber(adsBannerImages.length)];
      bannerTitle = adsBannerTitle[getRandomNumber(adsBannerTitle.length)];
      bannerDesc = adsBannerDesc[getRandomNumber(adsBannerDesc.length)];
    });



  }

  late Timer _timer;
  final int _start = 10;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            if(newHeight == 10)
              {
                newHeight = 0;
                newWidth = 0;
              }
            else
              {
                newWidth = 20;
                newHeight = 10;
              }
          });
        }
      },
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setValues();
    startTimer();
  }

  double newHeight=0;
  double newWidth=0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          adsCurrentLink = adsMainLinks[getRandomNumber(adsMainLinks.length)];
        });
        launchURL(context, adsCurrentLink);
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: height-newHeight,
        width: MediaQuery.of(context).size.width - newWidth,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                    width: MediaQuery.of(context).size.width,
                    height: height-newHeight,
                    child:  Image(image: AssetImage(bannerImg),fit: BoxFit.fill,)),



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



