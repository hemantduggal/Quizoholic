import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class QuizGameWidget extends StatelessWidget {
  final String title;
  const QuizGameWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/quizPlay');
      },
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width-50,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blue.shade900,
              Colors.lightBlue.shade500,
              Colors.blue.shade900,

            ]),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: LottieBuilder.asset("assets/lottie/18269-the-shining-trophy.json"),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(title,style: const TextStyle(color: Colors.white,fontSize: 25),),
            ),

            const Spacer(),

            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(CupertinoIcons.arrowshape_turn_up_right_fill,color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
