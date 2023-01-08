import 'dart:math';

import 'package:flutter/material.dart';

import '../Networking/web.dart';
import '../Variables/conn.dart';


class PopupBackAds extends StatefulWidget {
  const PopupBackAds({Key? key}) : super(key: key);

  @override
  _PopupBackAdsState createState() => _PopupBackAdsState();
}

class _PopupBackAdsState extends State<PopupBackAds> {

  String bannerImg="",adsCurrentLink="",gifLink="",bannerTitle="",bannerDesc="";

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
      gifLink = adsBannerGif[getRandomNumber(adsBannerGif.length)];
      bannerTitle = adsBannerTitle[getRandomNumber(adsBannerTitle.length)];
      bannerDesc = adsBannerDesc[getRandomNumber(adsBannerDesc.length)];

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
        backgroundColor: Colors.white,
        body: Stack(
          children: [

            Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 30,bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(width: 40,height: 30,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                        color: Colors.blue.shade500
                      ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Text("AD",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(Icons.highlight_remove_rounded,size: 30,color: Colors.black45,),
                        ),
                      )

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


                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image(image: AssetImage(gifLink),width: 100,),
                                    ),
                                     Text(bannerTitle,style: const TextStyle(fontSize: 25),),
                                     Text(bannerDesc,style: const TextStyle(fontSize: 20,color: Colors.black38),),

                                    const Spacer(),

                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image(image: AssetImage(bannerImg),),
                                    ),

                                    const Spacer(),

                                    const Text("Play Quiz & Win Upto 50,000 Coins",style: TextStyle(fontSize: 18,color: Colors.black26),),


                                    const Spacer(),

                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width/2+MediaQuery.of(context).size.width/3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.blue.shade500,
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
