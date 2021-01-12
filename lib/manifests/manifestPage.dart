import 'package:cloudofgoods/manifests/pannel/drawer.dart';
import 'package:cloudofgoods/manifests/pannel/tabbarpannel.dart';
import 'package:cloudofgoods/manifests/pannel/toppanel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Manifests extends StatefulWidget {
  @override
  _ManifestsState createState() => _ManifestsState();
}

class _ManifestsState extends State<Manifests> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Manifest"),
      ),
      body: Container(
        child: Column(
          children: [
            TopPanel(),
            TabPannel()
          ],
        ),
      ),
    );
  }
}
