import 'package:flutter/material.dart';

import '../common/main_tab.dart';
import '../manifests/pannel/deliverTab/deliveriesPannel.dart';
import '../manifests/pannel/drawer.dart';
import '../manifests/pannel/productTab/productpannel.dart';
import '../manifests/pannel/toppanel.dart';
import '../manifests/pannel/tripTab/tripPannel.dart';


class Manifests extends StatefulWidget {
  @override
  _ManifestsState createState() => _ManifestsState();
}

class _ManifestsState extends State<Manifests> with SingleTickerProviderStateMixin{
  // ignore: non_constant_identifier_names
  MainTabPannel main_tab;
  // ignore: non_constant_identifier_names
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
