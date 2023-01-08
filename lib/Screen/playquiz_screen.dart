import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Networking/web.dart';
import '../UnityAds/unity_ads_init.dart';
import '../Variables/conn.dart';
import '../Widgets/win_dialog.dart';



String ques="",rightAns="";
List<String> ansList=["","","",""];

int counter=0;

class QuizGameScreen extends StatefulWidget {
  const QuizGameScreen({Key? key}) : super(key: key);


  @override
  _QuizGameScreenState createState() => _QuizGameScreenState();
}

class _QuizGameScreenState extends State<QuizGameScreen> {


  List<int> winCoins=[100];

  bool clickable=true;

  int correct=0,incorrect=0;



  void declareWinner() //called when clicked on right answer
  {
    setState(() {
      int z = winCoins[0];
      setValues(z, 1);
      showWinDialog(context,z.toString());
    });
  }

  void setvalues() //to set quiz colour vales
  {
    setState(() {
      counter=0;
      correct=0;
      incorrect=0;
      _color1 = Colors.blue.shade900;

      _color2 = Colors.blue.shade900;

      _color3 = Colors.blue.shade900;

      _color4 = Colors.blue.shade900;
    });
  }

  int _start1=0;
  late Timer _timer1;

  void startSelectTimer() {
    setState(() {
      _start1 =1;
      const oneSec = Duration(seconds: 1);
      _timer1 = Timer.periodic(
        oneSec,
            (Timer timer) {
          if (_start1 == 0) {
            setState(() {
              timer.cancel();
              setQuizData();
            });
          } else {
            setState(() {
              _start1--;
            });
          }
        },
      );
    });

  }



  void shuffle(List items) {
    setState(() {
      var random = Random();

      // Go through all elements.
      for (var i = items.length - 1; i > 0; i--) {

        // Pick a pseudorandom number according to the list length
        var n = random.nextInt(i + 1);

        var temp = items[i];
        items[i] = items[n];
        items[n] = temp;
      }

    });
  }


  Color _color1 = Colors.blue.shade900;

  Color _color2 = Colors.blue.shade900;

  Color _color3 = Colors.blue.shade900;

  Color _color4 = Colors.blue.shade900;



  void setQuizData()  // set quiz answers with shuffle
  {

    if(counter>=quizList.length)
    {
      //show game over box
      _showMyDialog(context);
      return;
    }

    setState(() {
      _color1 = Colors.blue.shade900;
      _color2 = Colors.blue.shade900;
      _color3 = Colors.blue.shade900;
      _color4 = Colors.blue.shade900;

      ques = quizList[counter];
      rightAns = quizList[counter+1];
      ansList[0] = quizList[counter+1];
      ansList[1] = quizList[counter+2];
      ansList[2] = quizList[counter+3];
      ansList[3] = quizList[counter+4];
      shuffle(ansList);
      counter = counter + 5 ;
      clickable=true;
    });
    //startTimer();
  }

  void setValues(int diamond,int quiz) async
  {
    setState(() async {

      diamondLeft = await setCoins(diamond);
      quizLeft = await setQuiz(quiz);

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setvalues();
    setQuizData();

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {

        //trigger leaving and use own data
        Navigator.pop(context, false);

        Navigator.popAndPushNamed(context, '/1');
        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(0),),),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }
          ),
          centerTitle: true,

          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.elliptical(0,69),bottomRight: Radius.elliptical(0,69)),
              gradient: LinearGradient(
                  colors: [
                    Colors.lightBlue.shade500,
                    Colors.lightBlue.shade900,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          title: const Text("Play Quiz",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.black,
          elevation: 20,
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.lightBlue.shade400
                    ],
                    begin: Alignment.topCenter,
                    end:  Alignment.bottomCenter,

                  )
              ),
            ),

            ListView(
              scrollDirection: Axis.vertical,
              children: [

                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(80,50),bottomRight: Radius.elliptical(80,50)),
                      color: Colors.black26
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Icon(CupertinoIcons.check_mark,color: Colors.green,size: 40,),
                                Text("$correct",style: const TextStyle(color: Colors.white,fontSize: 16),),
                              ],
                            ),
                          ),

                          Lottie.asset(
                              'assets/lottie/44177-quiz.json',height: 100),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(CupertinoIcons.xmark_octagon,color: Colors.red[500],size: 40,),
                                Text("$incorrect",style: const TextStyle(color: Colors.white,fontSize: 16),),
                              ],
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25,left: 5,right: 5,top: 10),
                        child: Text(
                          "Q: $ques",style: const TextStyle(color: Colors.white,fontSize: 18),textAlign: TextAlign.center,
                        ),
                      )

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 1,right: 1),
                  child: Container(
                    height: MediaQuery.of(context).size.height-340,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                        color: Colors.black26
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [


                        Stack(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(top: 39),
                              child: CustomPaint(
                                size: const Size(1000, 15),
                                painter: CurvePainter(),
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5,left: 20,right: 20),
                                  child: InkWell(
                                    onTap: (){

                                      if(clickable==false) {
                                        return;
                                      }

                                      setState(() {
                                        clickable=false;


                                        if(rightAns==ansList[0])
                                        {
                                          _color1 = Colors.green.shade700;
                                          correct++;

                                          declareWinner();
                                        }
                                        else
                                        {
                                          _color1 = Colors.red.shade700;
                                          incorrect++;

                                        }
                                      });

                                      startSelectTimer(); // to give 2 second break

                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      width: MediaQuery.of(context).size.width-80,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(bottomLeft: Radius.elliptical(100,50),bottomRight: Radius.elliptical(100,50),topLeft: Radius.elliptical(100,50),topRight: Radius.elliptical(100,50)),
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                _color1,
                                                _color1,
                                                _color1,
                                              ]
                                          ),
                                          border: Border.all(color: Colors.white,width: 2)

                                      ),
                                      child: Center(
                                        child:
                                        Text(
                                          "A: "+ansList[0],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 17
                                          ),textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),

                        Stack(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(top: 39),
                              child: CustomPaint(
                                size: const Size(1000, 15),
                                painter: CurvePainter(),
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5,left: 20,right: 20),
                                  child: InkWell(
                                    onTap: (){
                                      if(clickable==false) {
                                        return;
                                      }

                                      setState(() {
                                        clickable=false;

                                        if(rightAns==ansList[1])
                                        {
                                          _color2 = Colors.green.shade700;
                                          correct++;
                                          declareWinner();

                                        }
                                        else
                                        {
                                          _color2 = Colors.red.shade700;
                                          incorrect++;

                                        }

                                      });
                                      startSelectTimer();

                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      width: MediaQuery.of(context).size.width-80,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(bottomLeft: Radius.elliptical(100,50),bottomRight: Radius.elliptical(100,50),topLeft: Radius.elliptical(100,50),topRight: Radius.elliptical(100,50)),
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                _color2,
                                                _color2,
                                                _color2,
                                              ]
                                          ),
                                          border: Border.all(color: Colors.white,width: 2)

                                      ),
                                      child: Center(
                                        child:
                                        Text(
                                          "B: "+ansList[1],textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 17
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),

                        Stack(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(top: 39),
                              child: CustomPaint(
                                size: const Size(1000, 15),
                                painter: CurvePainter(),
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5,left: 20,right: 20),
                                  child: InkWell(
                                    onTap: (){
                                      if(clickable==false) {
                                        return;
                                      }
                                      setState(() {
                                        clickable=false;

                                        if(rightAns==ansList[2])
                                        {
                                          _color3 = Colors.green.shade700;
                                          correct++;
                                          declareWinner();

                                        }
                                        else
                                        {
                                          _color3 = Colors.red.shade700;
                                          incorrect++;

                                        }


                                      });

                                      startSelectTimer();


                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      width: MediaQuery.of(context).size.width-80,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(bottomLeft: Radius.elliptical(100,50),bottomRight: Radius.elliptical(100,50),topLeft: Radius.elliptical(100,50),topRight: Radius.elliptical(100,50)),
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                _color3,
                                                _color3,
                                                _color3,
                                              ]
                                          ),
                                          border: Border.all(color: Colors.white,width: 2)

                                      ),
                                      child: Center(
                                        child:
                                        Text(
                                          "C: "+ansList[2],textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 17
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),

                        Stack(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(top: 39),
                              child: CustomPaint(
                                size: const Size(1000, 15),
                                painter: CurvePainter(),
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5,left: 20,right: 20),
                                  child: InkWell(
                                    onTap: (){
                                      if(clickable==false) {
                                        return;
                                      }

                                      setState(() {
                                        clickable=false;

                                        if(rightAns==ansList[3])
                                        {
                                          _color4 = Colors.green.shade700;
                                          correct++;
                                          declareWinner();

                                        }
                                        else
                                        {
                                          _color4 = Colors.red.shade700;
                                          incorrect++;

                                        }

                                      });

                                      startSelectTimer();


                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      width: MediaQuery.of(context).size.width-80,
                                      height: 70,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(bottomLeft: Radius.elliptical(100,50),bottomRight: Radius.elliptical(100,50),topLeft: Radius.elliptical(100,50),topRight: Radius.elliptical(100,50)),
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                _color4,
                                                _color4,
                                                _color4,
                                              ]
                                          ),
                                          border: Border.all(color: Colors.white,width: 2)

                                      ),
                                      child: Center(
                                        child:
                                        Text(
                                          "D: "+ansList[3],textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 17
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        )


                      ],
                    ),
                  ),
                )

              ],
            ),

            Row(
              children: [
                for(int z=0;z<incorrect+correct;z++)
                  fillRow(context),
              ],
            )

          ],
        ),
      ),
    );
  }
}


class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, size.height / 2, size.width, 0);
    path.quadraticBezierTo(size.width / 2, -size.height / 2, 0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }}






Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Notification!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Game Over'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Home'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}





Widget fillRow(context)
{
  return Container(
    width: MediaQuery.of(context).size.width/10,
    height: 5,
    color: Colors.white,
  );
}