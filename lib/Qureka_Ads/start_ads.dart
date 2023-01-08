import 'package:flutter/material.dart';
import 'package:spinmaster/Networking/web.dart';
import 'package:spinmaster/Variables/conn.dart';

class StartAds extends StatefulWidget {
  const StartAds({Key? key}) : super(key: key);

  @override
  _StartAdsState createState() => _StartAdsState();
}

class _StartAdsState extends State<StartAds> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children:  [
            const Image(image: AssetImage("assets/images/theme/startbg.png"),fit: BoxFit.fill,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:   [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:  [
                      InkWell(
                          onTap: (){
                            Navigator.pop(context);
                            },
                          child: const Icon(Icons.highlight_remove_rounded,size: 30,color: Colors.white,))
                    ],
                  ),

                  const Text("AWESOME",style: TextStyle(color: Colors.orange,fontSize: 20),),
                  const Text("FUN GAMES",style: TextStyle(color: Colors.white,fontSize: 50),),
                  const Padding(
                    padding: EdgeInsets.only(left: 100),
                    child: Text("ARE FREE FOR YOU",style: TextStyle(color: Colors.white,fontSize: 15)),
                  ),


                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text("Win Daily\n2,50,000",style: TextStyle(color: Colors.orange,fontSize: 25),),
                  ),

                  const Spacer(),

                  InkWell(
                    onTap: (){
                      launchURL(context, otherAdsLinksList[0]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width/2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Center(child: Text("Play Now",style: TextStyle(fontSize: 25),),),
                          ),
                        ],
                      ),
                    ),
                  ),


                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
