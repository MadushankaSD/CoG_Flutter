import 'package:flutter/material.dart';

class NestedTab extends StatefulWidget {
  final String name;
  final TabController tabController;

  @override
  NestedTabState createState() => NestedTabState();

  NestedTab(this.name,this.tabController);
}

class NestedTabState extends State<NestedTab> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(super.widget.name,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54)),
        ),
        new Spacer(),
        Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              children: [
                Container(
                  child: TabBar(
                    controller: super.widget.tabController,
                    labelPadding: EdgeInsets.all(0),
                    labelStyle: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold),
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.black54,
                    tabs: <Widget>[
                      Tab(text: "All",),
                      Tab(text: "Processed",),
                      Tab(text: "Open",)
                    ],
                  ),
                ),
              ],
            )
        ),
      ],
    );
  }
}