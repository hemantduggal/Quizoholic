import 'package:flutter/material.dart';


Widget HomeWidget2(context,String title,String desc,String img,String btn,String route,Color a,Color b,Color c,String title2,String desc2,String img2,String btn2,String route2,Color a2,Color b2,Color c2)
{
  return  Padding(
    padding: const EdgeInsets.only(top: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        InkWell(
          onTap: (){
            Navigator.pushNamed(context, route);
          },
          child: Container(
            height: MediaQuery.of(context).size.height/4,
            width: MediaQuery.of(context).size.width/2-10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [
                    a,
                    b
                  ]
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Image(image: AssetImage(img),width: 55,),
                Text(title,style: TextStyle(fontSize: 25,color: Colors.white),),
                Text(desc,style: TextStyle(fontSize: 15,color: Colors.white),),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width/5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: c
                  ),
                  child: Center(child: Text(btn,style: TextStyle(color: Colors.white),)),
                )
              ],
            ),
          ),
        ),

        InkWell(
          onTap: (){
            Navigator.pushNamed(context, route2);
          },
          child: Container(
            height: MediaQuery.of(context).size.height/4,
            width: MediaQuery.of(context).size.width/2-10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [
                    a2,
                    b2
                  ]
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Image(image: AssetImage(img2),width: 55,),
                Text(title2,style: TextStyle(fontSize: 25,color: Colors.white),),
                Text(desc2,style: TextStyle(fontSize: 15,color: Colors.white),),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width/5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: c2
                  ),
                  child: Center(child: Text(btn2,style: TextStyle(color: Colors.white),)),
                )
              ],
            ),
          ),
        ),


      ],
    ),
  );
}