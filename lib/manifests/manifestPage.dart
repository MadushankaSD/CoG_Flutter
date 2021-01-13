import 'package:cloudofgoods/common/main_tab.dart';
import 'package:cloudofgoods/manifests/pannel/deliverTab/deliveriesPannel.dart';
import 'package:cloudofgoods/manifests/pannel/drawer.dart';
import 'package:cloudofgoods/manifests/pannel/productTab/productpannel.dart';
import 'package:cloudofgoods/manifests/pannel/toppanel.dart';
import 'package:cloudofgoods/manifests/pannel/tripTab/tripPannel.dart';
import 'package:flutter/material.dart';

class Manifests extends StatefulWidget {
  @override
  _ManifestsState createState() => _ManifestsState();
}

class _ManifestsState extends State<Manifests> with SingleTickerProviderStateMixin{
  MainTabPannel main_tab;
  TabController main_tab_controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    main_tab_controller = TabController(length: 3, vsync: this);
    main_tab = MainTabPannel("Products","Deliveries","Trips",main_tab_controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    main_tab_controller.dispose();
    super.dispose();
  }

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
            main_tab,
            Expanded(
              child: TabBarView(
                controller: main_tab_controller,
                children: <Widget>[
                  Center(child: Product()),
                  Center(child: Deliveries()),
                  Center(child: Trip(),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
