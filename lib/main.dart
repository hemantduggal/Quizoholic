import 'package:flutter/material.dart';
import 'package:spinmaster/Screen/playquiz_screen.dart';
import 'package:spinmaster/Screen/signup_screen.dart';

import 'Screen/home_screen_2.dart';
import 'Screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpinMaster',
      theme: ThemeData(
        //fontFamily: GoogleFonts.caveatBrush().fontFamily,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const SplashScreen(),
        '//': (context) => const SignUpScreen(),
        '/1': (context) => const HomeScreen2(),
        '/quizPlay': (context) => const QuizGameScreen(),

      },
    );
  }
}


