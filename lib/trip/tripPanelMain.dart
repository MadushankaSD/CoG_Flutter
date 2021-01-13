import 'package:cloudofgoods/manifests/pannel/drawer.dart';
import 'package:cloudofgoods/manifests/pannel/toppanel.dart';
import 'package:cloudofgoods/trip/nestedListViwe/listPannel.dart';
import 'package:flutter/material.dart';

class TripMain extends StatefulWidget {
  @override
  _TripMainState createState() => _TripMainState();
}

class _TripMainState extends State<TripMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Trips"),
      ),
      body: Container(
        child: Column(
          children: [
            TopPanel(),
            TripList(),
            Container(
              height:100,
              child: GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  child: Image.asset(
                    "assets/images/add_trip/drawable-xhdpi/add_to_a_trip.png",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

