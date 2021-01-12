
import 'package:cloudofgoods/manifests/pannel/common/nested_tab.dart';
import 'package:cloudofgoods/manifests/pannel/productTab/nestedTab/processedTabPannel.dart';
import 'package:cloudofgoods/manifests/pannel/productTab/nestedTab/product_all_tab_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> with SingleTickerProviderStateMixin{

  TabController tabcontroller;
  NestedTab nested_tab;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontroller=TabController(length: 3,vsync: this);
    nested_tab = NestedTab("Product",3,tabcontroller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabcontroller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: nested_tab,
        ),
        Padding(
          padding: EdgeInsets.only(top:50),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                // color: Colors.red,
                width: double.infinity,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child:Text("Drop-offs",style: TextStyle(color: Colors.black54,fontSize: 12)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child:Text("Pickups",style: TextStyle(color: Colors.black54,fontSize: 12)),
                    ),
                  ],
                ),
              ),
               Expanded(
                flex: 1,
                child: TabBarView(
                  controller:tabcontroller,
                  children: <Widget>[
                    Container(child: AllTab(),),
                    Container(child: TestClip(),),
                    Container(color: Colors.amber,),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
