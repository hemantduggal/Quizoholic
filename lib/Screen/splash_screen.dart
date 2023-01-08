
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spinmaster/Widgets/toast_demo.dart';
import '../Networking/web.dart';
import '../Variables/conn.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  void resetPrefsData()
  async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString('day')==null || prefs.getString('day') != DateTime.now().day.toString() )
    {
      setState(()  {
        prefs.setString('day', DateTime.now().day.toString());
        prefs.setInt('spin', 50);
        prefs.setInt('scratch', 50);
        prefs.setInt('quiz', 50);
        prefs.setStringList('taskCompleted',["0"]);
      });


    }
    else
      {
        setState(() {
          taskOfferList = prefs.getStringList('taskCompleted')!;
        });
      }



  }






  void fetchOtherLinksLocal() async
  {
    var s = await fetchOtherLinks();
    setState(() {
      List<String> listD = s.toString().split('|');
      rateBtn = listD[0];
      moreBtn = listD[1];
      shareBtn = listD[2];
      privacyBtn = listD[3];

    });


  }


  void fetchWebsitesLocal() async
  {
    var s = await fetchWebsites();
    setState(() {
       adsMainLinks = s.toString().split('|');
    });

  }

  void fetchLoginData() async
  {
    var s = await fetchLogin(email.text, password.text);
    print("  email :  " + s);
    if(email.text == s.toString().trim())
      {
        Navigator.popAndPushNamed(context, '/1');
      }
    else
      {
        showFlutterToast("Email Password Incorrect");
      }

  }


  void fetchMoreCoinsLocal() async //storing rewards on server
  {
    var s = await fetchMoreCoinList();
    setState(() {
      moreCoinsTaskList = s.toString().split('|');
    });

  }

  void fetchOtherAdsLinkLocal() async
  {
    var s = await fetchOtherAdsLinks();
    setState(() {
      otherAdsLinksList = s.toString().split(',');
    });

  }


  void fetchGamesBannerLinkLocal() async
  {
    var s = await fetchGameBannerLinks();
    setState(() {
      gamesBanner = s.toString().trim().split('|');
    });

  }






  void initOnesignal() //initialise push notification
  {
    //Remove this method to stop OneSignal Debugging
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId("44f98a55-8e5a-4fba-aca2-efa43f345ffd"); //one signal id connect

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    });
  }



  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initOnesignal();
    fetchOtherAdsLinkLocal(); //fetching quiz data
  }


  final email = TextEditingController();
  final password = TextEditingController();


  void checkLogin() //validations
  {
    if(email.text.length<10)
      {
        showFlutterToast("Invalid Email");
        return;
      }
    else if(email.text.contains('@')==false)
    {
      showFlutterToast("Invalid Email");
      return;
    }
    else if(password.text.length<3)
    {
      showFlutterToast("Password must be 3 length"); //it shows notification
      return;
    }
    fetchLoginData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [

            Spacer(),
            Spacer(),

            Image(image: AssetImage("assets/images/icon.png"),width: 150,),
            Text("Please Login",style: TextStyle(fontSize: 25,color: Colors.black),),


            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: email,
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  border: OutlineInputBorder(
                  ),
                  labelText: 'Email',
                  hintText: 'Enter Email',
                ),


              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  border: OutlineInputBorder(
                  ),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                ),


              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  checkLogin();
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 20),),),
                ),
              ),
            ),


            Spacer(),

            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '//');
                },
                child: Text("New User? Signup",style: TextStyle(fontSize: 18),)),
            Spacer(),
            Spacer(),

        ],
        ),
      ),
    );
  }
}


