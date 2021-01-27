import 'package:cloudofgoods/ui/manifests/pannel/deliverTab/notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/home/homePage.dart';
import './ui/splash_screen/splash.dart';

void main() {
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<SingleNotifier>(create: (_)=> SingleNotifier())
      ],
      child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        'home':(context)=>Home(),
      },
    );
  }
}

