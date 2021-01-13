import 'package:cloudofgoods/common/main_tab.dart';
import 'package:cloudofgoods/manifests/pannel/toppanel.dart';
import 'package:flutter/material.dart';

class TripDetail extends StatefulWidget {
  int trip_id;

  @override
  _TripDetailState createState() => _TripDetailState();
   TripDetail(this.trip_id);
}

class _TripDetailState extends State<TripDetail> with SingleTickerProviderStateMixin{
  MainTabPannel main_tab;
  TabController main_tab_controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    main_tab_controller = TabController(length: 3, vsync: this);
    main_tab = MainTabPannel("Loaded list","Deliveries","Summary",main_tab_controller);
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(super.widget.trip_id.toString()),
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
                  Container(color: Colors.red,),
                  Container(color: Colors.green,),
                  Container(color: Colors.yellowAccent,)
                  // Center(child: Product()),
                  // Center(child: Deliveries()),
                  // Center(child: Trip(),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
