import 'package:flutter/material.dart';
import 'package:spinmaster/Qureka_Ads/small_icon.dart';

import '../Variables/conn.dart';

class TopBar2 extends StatelessWidget {
  final String title;
  const TopBar2({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        children: [

         /* const Padding(
            padding: EdgeInsets.only(left: 10,top: 5),
            child: QurekaSmallIcon(width: 50,linkNumber: 17,),
          ),*/

          const Spacer(),
          Stack(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 32,
                  letterSpacing: 5,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 4
                    ..color = Colors.white,
                ),
              ),
              // The text inside
               Text(
                title,
                style: const TextStyle(
                  fontSize: 32,
                  letterSpacing: 5,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                ),
              ),
            ],
          ),

          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Image(image: AssetImage("assets/images/dmg.png"),width: 35,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20,left: 10),
                    child: Text(diamondLeft.toString(),style: const TextStyle(color: Colors.white,fontSize: 25),),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
