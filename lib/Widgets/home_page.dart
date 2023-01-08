import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spinmaster/UnityAds/unity_ads_init.dart';
import 'package:spinmaster/Variables/conn.dart';
import 'package:spinmaster/Widgets/win_dialog.dart';

import '../Networking/web.dart';

Widget homeWidgets(context,String route1,String route2,String img1,String img2)
{
  return
    Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [


          InkWell(
            onTap: (){
              if(route1=='/dailyWin')
                {
                  if(dailyWinCoinCollected==false) {
                    showWinDialog(context, "200");
                    dailyWinCoinCollected=true;
                  }
                  else {
                    showLimitDialog(context);
                  }
                }
              else
                {
                  Navigator.pushNamed(context,route1);
                }
             },
            child: SizedBox(
              width: MediaQuery.of(context).size.width/2-30,
              height: MediaQuery.of(context).size.height/4-30,
              child:  Image(
                image: AssetImage(img1),height: 120,fit: BoxFit.fill,
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context,route2);
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width/2-30,
              height: MediaQuery.of(context).size.height/4-30,
              child: Image(
                  image: AssetImage(img2,),height: 120,fit:BoxFit.fill
              ),
            ),
          )
        ],
      ),
    );
}





Widget homeWidgets2(context,String img1,String img2)
{
  String adsCurrentLink;

  return
    Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [


          InkWell(
            onTap: (){
              launchURL(context,otherAdsLinksList[1]);
              loadUnityInter();

            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width/2-30,
              height: MediaQuery.of(context).size.height/4-30,
              child:  Image(
                image: AssetImage(img1),height: 120,fit: BoxFit.fill,
              ),
            ),
          ),
          InkWell(
            onTap: (){
              launchURL(context,otherAdsLinksList[2]);
              loadUnityInter();
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width/2-30,
              height: MediaQuery.of(context).size.height/4-30,
              child: Image(
                  image: AssetImage(img2,),height: 120,fit:BoxFit.fill
              ),
            ),
          )
        ],
      ),
    );
}


