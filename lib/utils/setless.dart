import 'package:clock_app/utils/1watch.dart';
import 'package:flutter/material.dart';

import '2watch.dart';
import '3watch.dart';

class clock_App extends StatelessWidget {
  const clock_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => Alaram(),
        '/second' : (context) => second(),
        '/strapwatch' : (context) => strapwatch(),
      },
    );
  }
}
