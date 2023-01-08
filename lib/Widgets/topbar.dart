import 'package:flutter/material.dart';

import '../Qureka_Ads/small_icon.dart';

class TopBar extends StatelessWidget {
  final String title;
  const TopBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [

              const Padding(
                padding: EdgeInsets.only(left: 10,top: 5),
                child: QurekaSmallIcon(width: 50,linkNumber: 17,),
              ),

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
                        ..color = Colors.blue.shade700,
                    ),
                  ),
                  // The text inside
                   Text(
                    title,
                    style: const TextStyle(
                      fontSize: 32,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const Padding(
                padding: EdgeInsets.only(right: 10,top: 2),
                child: QurekaSmallIcon(width: 50,linkNumber: 18,),
              ),

            ],
          )
        ],
      ),
    );
  }
}



