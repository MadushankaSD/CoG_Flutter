import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double paddingBottom = 30;
  bool isConnected = true;

  Future<void> startTimer() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          isConnected = true;
        });
        Timer(Duration(seconds: 2), () {
          setState(() {
            paddingBottom = MediaQuery.of(context).size.height * 0.855;
          });
        });

        if(isConnected) {
          Timer(Duration(seconds: 3), () {
            Navigator.of(context).pushReplacementNamed('home');
          });
        }
      }
    } on SocketException catch (_) {
      Navigator.of(context).pushReplacementNamed('home');
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
            padding: EdgeInsets.only(bottom: paddingBottom),
            child: Image.asset('assets/images/cloud_of_goods.png',
                width: MediaQuery.of(context).size.width * 0.7),
          ),
          Visibility(
            visible: !isConnected,
            child: Center(
              child: Container(
               child: InternetError()
              ),
            ),
          )
        ],
      ),
    );
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
