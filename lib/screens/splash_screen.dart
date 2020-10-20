import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_demo/screens/select_class_section.dart';
import 'package:flutter_app_demo/widgets/logo_widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FadeIn();
}

class FadeIn extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    moveToScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Center(
          child: Container(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LogoWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  new Text(
                    "Flutter App",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  void moveToScreen() async {
    Timer _timer = new Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        new CupertinoPageRoute(builder: (BuildContext context) {
          return SelectClassSection();
        }),
        (route) => false,
      );
    });
  }
}
