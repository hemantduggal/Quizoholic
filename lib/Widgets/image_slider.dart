
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spinmaster/Networking/web.dart';
import 'package:spinmaster/Variables/conn.dart';


class imageSliders extends StatelessWidget {
  final List<String> imgList;
  const imageSliders({Key? key, required this.imgList}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 150,
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: [
          for(int z=0;z<imgList.length;z=z+2)
            InkWell(
              onTap: (){
                launchURL(context, imgList[z+1]);
              },
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[

                        Image.network(imgList[z], fit: BoxFit.fill, width: 1000.0,height: 150,),


                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
        ],
      ),
    );
  }
}

