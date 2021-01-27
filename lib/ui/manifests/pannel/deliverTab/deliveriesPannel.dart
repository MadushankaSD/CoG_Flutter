import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:circular_check_box/circular_check_box.dart';
import '../../../common/nested_tab.dart';
import 'nested_tab/deliver_all_tab_pannel.dart';


class Deliveries extends StatefulWidget {
  @override
  _DeliveriesState createState() => _DeliveriesState();
}

class _DeliveriesState extends State<Deliveries>
    with SingleTickerProviderStateMixin {
  bool selected=true ;
  TabController tabController;
  NestedTab nestedTab;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
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
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: nestedTab,
        ),
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 4,
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    Container(child: DeliverAllTab()),
                    Container(color: Colors.brown),
                    Container(color: Colors.amber),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.13,
                child: Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: Row(
                    children: [
                          Expanded(flex: 1, child: Container()),
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(20))),
                                              title: Text("Create Trip"),
                                              content: TextField(
                                                onChanged: (value) {
                                                  print(value);
                                                },
                                                controller: _textFieldController(),
                                                decoration: InputDecoration(
                                                    hintText: "Text Field in Dialog"),
                                              ),
                                              actions: [
                                                FlatButton(
                                                    onPressed: () {},
                                                    child: Text("Create")),
                                                FlatButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context, false),
                                                    child: Text("Cancel"))
                                              ],
                                            )
                                    );
                                  },
                                  child: ClipRRect(
                                    child: Image.asset(
                                      "assets/images/add_trip/drawable-xhdpi/add_to_a_trip.png",
                                    ),
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (ctx)=>
                                        AlertDialog(
                                          title: Text("Select a trip"),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          actions: <Widget>[

                                            Container(
                                              alignment: Alignment.center,
                                              width: MediaQuery.of(ctx).size.width,
                                              height:70,
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: ClipRRect(
                                                  child: Image.asset(
                                                      "assets/images/edit_trip/drawable-xhdpi/group_3.png"),
                                                ),
                                              ),
                                            )
                                          ],
                                          content: SingleChildScrollView(
                                            child: Container(
                                              width: double.maxFinite,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Divider(),
                                                  ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                    maxHeight: MediaQuery.of(context).size.height * 0.3,
                                                    ),
                                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: 3,
                                                        itemBuilder: (BuildContext context, int index) {
                                                          return ListTile(
                                                            leading: Text("Name of Driver"),
                                                            trailing: CircularCheckBox(
                                                                value: this.selected,
                                                                checkColor: Colors.white,
                                                                activeColor: Colors.green,
                                                                // inactiveColor: Colors.black,
                                                                disabledColor: Colors.grey ,
                                                                onChanged: (val) => this.setState(() {
                                                                  this.selected= !this.selected;
                                                                })
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                  Divider(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                    );
                                  },
                                  child: ClipRRect(
                                      child: Image.asset(
                                          "assets/images/edit_trip/drawable-xhdpi/group_3.png")),
                                ),
                              )),
                          Expanded(
                            flex: 3,
                            child: Container(
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context)=>AlertDialog(
                                        title: Text("Reassignment"),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        content: SingleChildScrollView(
                                          child: Container(
                                            width: double.maxFinite,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Divider(),
                                                ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                    maxHeight: MediaQuery.of(context).size.height * 0.4,
                                                  ),
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: 3,
                                                      itemBuilder: (BuildContext context, int index) {
                                                        return ListTile(
                                                          leading: ClipRRect(
                                                              child: Image.asset(
                                                                  "assets/images/edit_trip/drawable-xhdpi/group_3.png")),
                                                          title: Text("Name of Driver"),
                                                          trailing: CircularCheckBox(
                                                              value: this.selected,
                                                              checkColor: Colors.white,
                                                              activeColor: Colors.green,
                                                              // inactiveColor: Colors.black,
                                                              disabledColor: Colors.grey ,
                                                              onChanged: (val) => this.setState(() {
                                                                this.selected= !this.selected;
                                                             })
                                                          ),
                                                        );
                                                      }),
                                                ),
                                                Divider(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    );
                                  },
                                  child: ClipRRect(
                                    child: Image.asset(
                                        "assets/images/edit_trip/drawable-xhdpi/group_3.png"),
                                  ),
                                )
                            ),
                          ),
                          Expanded(flex: 1, child: Container()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  _textFieldController() {}
}
