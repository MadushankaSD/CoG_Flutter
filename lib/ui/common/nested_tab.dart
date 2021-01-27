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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
                  super.widget.name,
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54)),
        ),

        Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              children: [
                Expanded(
                  child: TabBar(
                    controller: super.widget.tabController,
                    isScrollable: true,
                    // indicatorColor: Colors.transparent,
                    labelPadding: EdgeInsets.all(12),
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
