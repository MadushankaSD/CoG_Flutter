import 'package:flutter/material.dart';
import '../../../common/main_tab.dart';
import '../../../manifests/pannel/toppanel.dart';
import 'deliveries/trip_delivery_pannel.dart';
import 'loadedlist/trip_load_list.dart';
import 'summary/trip_summery_pannel.dart';


class TripDetail extends StatefulWidget {
  final int tripId;

  @override
  _TripDetailState createState() => _TripDetailState();
   TripDetail(this.tripId);
}

class _TripDetailState extends State<TripDetail> with SingleTickerProviderStateMixin{
  MainTabPannel mainTab;
  TabController mainTabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainTabController = TabController(length: 3, vsync: this);
    mainTab = MainTabPannel("Loaded list","Deliveries","Summary",mainTabController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    mainTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(super.widget.tripId.toString()),
      ),
      body: Container(
        child: Column(
          children: [
            TopPanel(),
            mainTab,
            Expanded(
              child: TabBarView(
                controller: mainTabController,
                children: <Widget>[
                  Center(child:LoadList()),
                  Container(child: TripDeliveries(),),
                  Container(child: TripSummary(),)
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
