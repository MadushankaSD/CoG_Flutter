import 'package:cloudofgoods/home/homePage.dart';
import 'package:cloudofgoods/manifests/manifestPage.dart';
import 'package:cloudofgoods/notification/notificationPannel.dart';
import 'package:cloudofgoods/splash_screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        'home':(context)=>Home(),
        'manifest':(context)=>Manifests(),
        'notification':(context)=>NotificationAll(),
      },
    );
  }
}

