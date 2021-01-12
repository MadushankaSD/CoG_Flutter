import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {


  @override
  _SplashScreenState createState() => _SplashScreenState();}

class _SplashScreenState extends State<SplashScreen> {

  double paddingbottom=30;

  void startTimer(){
    Timer(Duration(seconds: 2),(){
      setState(() {
        paddingbottom = MediaQuery.of(context).size.height*0.855;
      });

      // Navigator.of(context).pushReplacementNamed('home');
    });
  }

  void goMainPage(){
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed('home');
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    goMainPage();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: paddingbottom),
        child: Image.asset('assets/images/cloud_of_goods.png',width: MediaQuery.of(context).size.width*0.7),
      ),
    );

    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: Hero(
    //     tag: 'splash',
    //     child: Align(
    //       alignment:Alignment.bottomCenter,
    //       child: Padding(
    //           padding: EdgeInsets.only(bottom: 30),
    //           child: Image.asset('assets/images/cloud_of_goods.png',width: MediaQuery.of(context).size.width*0.7)),
    //     ),
    //   ),
    // );
  }
}
