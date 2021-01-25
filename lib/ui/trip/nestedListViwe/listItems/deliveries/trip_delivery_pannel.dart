import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../common/nested_tab.dart';
import 'nestedTab/trip_delivery_all.dart';


class TripDeliveries extends StatefulWidget {

  @override
  _TripDeliveriesState createState() => _TripDeliveriesState();
}

class _TripDeliveriesState extends State<TripDeliveries> with SingleTickerProviderStateMixin{
  TabController tabController;
  NestedTab nestedTab;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 3,vsync: this);
    nestedTab = NestedTab("Deliveries",tabController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Align(
            alignment: Alignment.topCenter,
            child: nestedTab,
          ),
        ),
        Expanded(
          flex: 1,
          child: TabBarView(
            controller:tabController,
            children: <Widget>[
              Container(child: TripDeliveryAll(),),
              Container(color: Colors.red,),
              Container(color: Colors.amber,),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height:90,
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 38,
                  backgroundColor: HexColor("#4ea2e2"),
                  child: Icon(Icons.play_arrow_outlined,size: 45,color: Colors.white,),
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width*0.07),
            Container(
              height:90,
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 38,
                  backgroundColor: HexColor("#4ea2e2"),
                  child: Icon(Icons.location_on_outlined,size: 40,color: Colors.white,),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
