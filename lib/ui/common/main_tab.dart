import 'package:flutter/material.dart';

class MainTabPannel extends StatefulWidget {
  final String category1;
  final String category2;
  final String category3;
  final TabController tabController;

  MainTabPannel(
      this.category1, this.category2, this.category3, this.tabController);

  @override
  _MainTabPannelState createState() => _MainTabPannelState();
}

class _MainTabPannelState extends State<MainTabPannel> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: TabBar(
                controller: super.widget.tabController,
                labelStyle: TextStyle(fontSize: 17),
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black54,
                tabs: <Widget>[
                  Tab(text: super.widget.category1,),
                  Tab(text: super.widget.category2,),
                  Tab(text: super.widget.category3,)
                ],
              ),
            ),
          ],
        ));
  }
}
