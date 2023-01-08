import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart' as app;

import '../Variables/conn.dart';






Future fetchOtherLinks() async{
  var url = Uri.parse(webLink + 'fetchOtherLinks.php');
  http.Response response = await http.post(
      url ,body: {


  });

  if(response.body.length>2)
  {
    return response.body;
  }
}



Future fetchBannerImage() async{
  var url = Uri.parse(webLink + 'bannerImages.php');
  http.Response response = await http.post(
      url ,body: {


  });

  if(response.body.length>2)
  {
    return response.body;
  }
}



Future fetchGameBannerLinks() async{
  var url = Uri.parse(webLink + 'gameBannerImages.php');
  http.Response response = await http.post(
      url ,body: {


  });

  if(response.body.length>2)
  {
    return response.body;
  }
}





Future fetchWebsites() async{
  var url = Uri.parse(webLink + 'fetchweb.php');
  http.Response response = await http.post(
      url ,body: {


  });

  if(response.body.length>2)
  {
    return response.body;
  }
}


Future fetchLogin(String email,String pass) async{
  final prefs = await SharedPreferences.getInstance();
  var url = Uri.parse('https://twinnyzone.in/megha/loginUser.php'); // convert url to uri form
  http.Response response = await http.post(
      url ,body: {
        'email' : email,
        'password' : pass

  });
  prefs.setString('email', email);
  if(response.body.length>2)
  {
    return response.body;
  }
}


Future storeLogin(String email,String pass) async{
  final prefs = await SharedPreferences.getInstance();
  var url = Uri.parse('https://twinnyzone.in/megha/storeUser.php');
  http.Response response = await http.post(
      url ,body: {
    'email' : email,
    'password' : pass

  });
  prefs.setString('email', email);
  if(response.body.length>2)
  {
    return response.body;
  }
}



Future storeScore(String score) async{
  final prefs = await SharedPreferences.getInstance();
  var url = Uri.parse('https://twinnyzone.in/megha/storeScore.php');
  http.Response response = await http.post(
      url ,body: {
    'email' : prefs.getString('email'),
    'score' : score

  });

  if(response.body.length>2)
  {
    return response.body;
  }
}



Future fetchQuiz(String table) async{
  var url = Uri.parse("https://twinnyzone.in/megha/fetchQuiz.php");
  http.Response response = await http.post(
      url ,body: {
    'table': table,
  });

  if(response.body.length>2)
  {
    return response.body;
  }
}




Future fetchOtherAdsLinks() async{
  var url = Uri.parse(webLink + 'otherAdsLinks.php');
  http.Response response = await http.post(
      url ,body: {


  });

  if(response.body.length>2)
  {
    return response.body;
  }
}





Future fetchMoreCoinList() async{
  var url = Uri.parse(webLink + 'morecoin.php');
  http.Response response = await http.post(
      url ,body: {


  });

  if(response.body.length>2)
  {
    return response.body;
  }
}







void launchURL(BuildContext context,String link) async {
  try {
    await launch(
      link,
      customTabsOption: CustomTabsOption(
        toolbarColor: Theme.of(context).primaryColor,
        enableDefaultShare: true,
        enableUrlBarHiding: true,
        showPageTitle: false,

        extraCustomTabs: const <String>[
          // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
          'org.mozilla.firefox',
          // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
          'com.microsoft.emmx',
        ],
      ),
      safariVCOption: SafariViewControllerOption(
        preferredBarTintColor: Theme.of(context).primaryColor,
        preferredControlTintColor: Colors.white,
        barCollapsingEnabled: true,
        entersReaderIfAvailable: false,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
      ),
    );
  } catch (e) {
    // An exception is thrown if browser app is not installed on Android device.
    debugPrint(e.toString());
  }
}




void launchAppURL(String _url) async {
  if (!await app.launch(_url)) throw 'Could not launch $_url';
}


//local store below

Future<int> setCoins(int coin)
async {
  final prefs = await SharedPreferences.getInstance();
  if(prefs.getInt('coin')==null)
    {
      prefs.setInt('coin', 0);
    }
  prefs.setInt('coin',prefs.getInt('coin')! + coin);
  int c = 0;
  c = prefs.getInt('coin')!;
  storeScore(c.toString());
  return c;
}



Future<int> setSpins(int spin)
async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setInt('spin',prefs.getInt('spin')! - spin);
  int c = 0;
  c = prefs.getInt('spin')!;
  return c;
}



Future<int> setQuiz(int spin)
async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setInt('quiz',prefs.getInt('quiz')! - spin);
  int c = 0;
  c = prefs.getInt('quiz')!;
  return c;
}



Future<int> setScratch(int scratch)
async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setInt('scratch',prefs.getInt('scratch')! - scratch);
  int c = 0;
  c = prefs.getInt('scratch')!;
  return c;
}



Future<List<String>> setTaskCompleted(int taskNumber)
async {
  final prefs = await SharedPreferences.getInstance();
  List<String> c = [];
  c = prefs.getStringList('taskCompleted')!;
  if(taskNumber==0)
  {

  }
  else
    {
      c.add(taskNumber.toString().trim().replaceAll('\n', ''));
      prefs.setStringList('taskCompleted',c);
    }
  return c;
}





