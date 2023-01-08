import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Networking/web.dart';
import '../Variables/conn.dart';

class QurekaPopupAds extends StatefulWidget {
  const QurekaPopupAds({Key? key}) : super(key: key);

  @override
  _QurekaPopupAdsState createState() => _QurekaPopupAdsState();
}

class _QurekaPopupAdsState extends State<QurekaPopupAds> {

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
      bannerImg = adsBannerImages[getRandomNumber(adsBannerImages.length)];

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white38,
        body: Stack(
          children: [

            Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 25,bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width/2+MediaQuery.of(context).size.width/4,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10))
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Image(image: AssetImage("assets/images/dmg.png"),),
                              ),

                              const Text("Continue to app",style: TextStyle(fontSize: 20,),),

                              const Spacer(),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.chevron_right,color: Colors.blue.shade700,size: 20,),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        adsCurrentLink = adsMainLinks[getRandomNumber(adsMainLinks.length)];
                      });
                      launchURL(context,adsCurrentLink);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Column(
                        children:  [
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text("Advertisement",style: TextStyle(fontSize: 17),),
                          ),

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.pink.shade50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    const Spacer(),
                                    const Text("Play & Win Coins Daily.",style: TextStyle(fontSize: 25),),

                                    const Spacer(),

                                     Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image(image: AssetImage(bannerImg),),
                                    ),

                                    const Text("Play Quiz & Win Upto 50,000 Coins",style: TextStyle(fontSize: 15,color: Colors.black26),),


                                    const Spacer(),

                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width/2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.green.shade700,
                                      ),
                                      child: const Center(
                                        child: Text("Play Now",style: TextStyle(color: Colors.white,fontSize: 18),),
                                      ),
                                    ),

                                    const Spacer()

                                  ],
                                ),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                )


              ],
            )

          ],
        ),
      ),
    );
  }
}

