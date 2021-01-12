import 'package:cloudofgoods/manifests/pannel/drawer.dart';
import 'package:flutter/material.dart';

class NotificationAll extends StatefulWidget {
  @override
  _NotificationAllState createState() => _NotificationAllState();
}

class _NotificationAllState extends State<NotificationAll> {
  var user= "madushanka";
  var delivery = "space 2";
  var qty = "32";
  var product = "bicycle";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notifications"),
      ),
      body: Container(
        child: ListView.separated(
            separatorBuilder: (BuildContext context,int index)=> Divider(
              color: Colors.black45,
              indent: 15,
              endIndent: 15,
              height: 25,
            ),
            // shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                minVerticalPadding: 10,
                title: Text("Accept delivery reassignment request",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text("${this.user} is requesting to assign ${this.delivery} contains ${this.qty} of ${this.product},"),
                ),

              );
            }),
      ),
    );
  }
}
