import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alaram extends StatefulWidget {
  const Alaram({super.key});

  @override
  State<Alaram> createState() => _AlaramState();
}

class _AlaramState extends State<Alaram> {
  @override
  Widget build(BuildContext context) {

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        dateTime=DateTime.now();
        if(dateTime.hour>11)
        {
          check='AM';
        }
        else
        {
          check='PM';
        }
        switch(dateTime.weekday)
        {
          case 1 : day = 'Monday';
          break;
          case 2 : day = 'Tuesday';
          break;
          case 3 : day = 'Wednesday';
          break;
          case 4 : day = 'Thursday';
          break;
          case 5 : day = 'Friday';
          break;
          case 6 : day = 'Saturday';
          break;
          case 7 : day = 'Sunday';
          break;
        }
      });
    });
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 867,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://hips.hearstapps.com/hmg-prod/images/moon-quotes-crescent-moon-657b3fc52a925.jpg?resize=980:*',
                  ),
                )
            ),
            child: Column(

              children: [
                SizedBox(height: 70,),
                Text('Alarm',style: TextStyle(fontSize: 35,fontWeight:FontWeight.bold,color: Colors.white),),
                SizedBox(height: 150,),
                Transform.rotate(angle: pi-10,child: Icon(Icons.notifications,size: 50,color: Colors.white,),),
                SizedBox(height: 100,),
                Text('${dateTime.day} : ${dateTime.month} : ${dateTime.year}',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color: Colors.white),),
                SizedBox(height: 5,),
                Text('${dateTime.hour} : ${dateTime.minute} : ${dateTime.second}',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color: Colors.white),),
                Text(day,style: TextStyle(fontSize:30,fontWeight: FontWeight.bold,color: Colors.white),),

                Container(
                  margin: EdgeInsets.only(top: 220,left: 250),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                  child: IconButton(onPressed: () {
                    Navigator.of(context).pushNamed('/second');
                  }, icon: Icon(CupertinoIcons.arrow_right)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
DateTime dateTime=DateTime.now();
String check='';
String day='';

