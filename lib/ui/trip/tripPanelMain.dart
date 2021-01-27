import 'package:flutter/material.dart';
import '../manifests/pannel/drawer.dart';
import '../manifests/pannel/toppanel.dart';
import 'nestedListViwe/listPannel.dart';

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
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: Container(height:100,
                child: GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/add_trip/drawable-xhdpi/add_to_a_trip.png",
                    ),
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

