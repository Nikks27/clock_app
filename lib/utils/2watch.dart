import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
        if (dateTime.hour < 11) {
          check = 'AM';
        } else {
          check = 'PM';
        }

        switch (dateTime.weekday) {
          case 1:
            day = 'monday';
            break;
          case 2:
            day = 'Tuesaday';
            break;
          case 3:
            day = 'wednesday';
            break;
          case 4:
            day = 'thursday';
            break;
          case 5:
            day = 'friday';
            break;
          case 6:
            day = 'saturday';
            break;
          case 6:
            day = 'sunday';
            break;
        }
      });
    });

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: () {
          Navigator.of(context).pop();
        },child: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 760,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    spreadRadius: 10,
                    blurRadius: 20,
                    blurStyle: BlurStyle.inner),
              ],
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.pexels.com/photos/4014721/pexels-photo-4014721.jpeg?auto=compress&cs=tinysrgb&w=600')),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 90,
                ),
                Text(
                  'Alarm',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                SizedBox(
                  height: 30,
                ),
                Transform.rotate(
                    angle: pi - 10,
                    child: Icon(
                      Icons.notifications_active,
                      size: 50,
                      color: Colors.white,
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '  ${dateTime.day}  / ${dateTime.month} / ${dateTime.year} ',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Text(
                  '${dateTime.hour % 12} : ${dateTime.minute} : ${dateTime.second}  $check ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  day,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.circle),
                  child: Stack(
                    children: [
                      ...List.generate(
                        60,
                            (index) => Transform.rotate(
                            angle: ((index + 1)) * 6 * pi / 180,
                            child: ((index + 1) % 5 == 0)
                                ? VerticalDivider(
                              thickness: 2,
                              color: Colors.red,
                              indent: 0,
                              endIndent: 160,
                            )
                                : VerticalDivider(
                              thickness: 3,
                              color: Colors.white,
                              indent: 0,
                              endIndent: 170,
                            )),
                      ),


                      Transform.rotate(
                        angle: dateTime.second * (6 * pi)/180,
                        child: const VerticalDivider(
                          thickness: 3,
                          indent: 20,
                          endIndent: 73,
                          color: Colors.red,
                        ),
                      ),
                      Transform.rotate(
                        angle: dateTime.minute * (6 * pi)/180,
                        child: const VerticalDivider(
                          thickness: 3,
                          indent: 20,
                          endIndent: 73,
                          color: Colors.black,
                        ),
                      ),
                      Transform.rotate(
                        angle: dateTime.hour * (30 * pi)/180,
                        child: const VerticalDivider(
                          thickness: 3,
                          indent: 30,
                          endIndent: 73,
                        ),
                      )
                    ],
                  ),

                ),
                Container(
                  margin: EdgeInsets.only(top: 145,left: 290),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                  child: IconButton(onPressed: () {
                    Navigator.of(context).pushNamed('/strapwatch');
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

DateTime dateTime = DateTime.now();
String check = '';
String day = '';