import 'dart:async';
import 'package:cloudofgoods/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double paddingbottom = 30;
  bool is_conneted = false;

  Future<void> startTimer() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          is_conneted = true;
        });
        Timer(Duration(seconds: 2), () {
          setState(() {
            paddingbottom = MediaQuery.of(context).size.height * 0.855;
          });
        });

        if(is_conneted) {
          Timer(Duration(seconds: 3), () {
            Navigator.of(context).pushReplacementNamed('home');
          });
        }
      }
    } on SocketException catch (_) {
      print('not connected');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: paddingbottom),
            child: Image.asset('assets/images/cloud_of_goods.png',
                width: MediaQuery.of(context).size.width * 0.7),
          ),
          Visibility(
            visible: !is_conneted,
            child: Center(
              child: Container(
               child: InternetError()
              ),
            ),
          )
        ],
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


class InternetError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("No Internet"),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(20))),
      content: Text("Check your internet Connection and try again"),
      actions: [
        FlatButton(
            onPressed: () =>{
              // Navigator.pop(context, false),
            // Navigator.of(context).pop(),
              SystemNavigator.pop()
            },
            //
            child: Text("Got it"))
      ],
    );
  }
}
