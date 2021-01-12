import 'package:cloudofgoods/manifests/pannel/deliverTab/deliveriesPannel.dart';
import 'package:cloudofgoods/manifests/pannel/productTab/productpannel.dart';
import 'package:cloudofgoods/manifests/pannel/tripTab/tripPannel.dart';
import 'package:flutter/material.dart';

class TabPannel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: TabBar(
                    labelStyle: TextStyle(fontSize: 17),
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.black54,
                    tabs: <Widget>[
                      Tab(text: "Products",),
                      Tab(text: "Deliveries",),
                      Tab(text: "Trips",)
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      Center(child: Product()),
                      Center(child: Deliveries()),
                      Center(child: Trip(),)
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
