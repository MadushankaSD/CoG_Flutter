import 'package:cloudofgoods/trip/nestedListViwe/listItems/loadedlist/scanner/app_barcode_scanner_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../common/trip_topic_pannel.dart';
import 'list_viwe.dart';

class LoadList extends StatefulWidget {
  @override
  _LoadListState createState() => _LoadListState();
}

class _LoadListState extends State<LoadList> {
  int value = 0;
  var colour = HexColor("#4ea2e2");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TripHeader("Load list"),
        Padding(
          padding: const EdgeInsets.only(right: 8,left: 8,bottom: 3,top:3 ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: FlatButton.icon(
                    height:60 ,
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.lightBlue)),
                    icon: FaIcon(FontAwesomeIcons.barcode,color: Colors.white,),
                    label: Text("Item scan",style: TextStyle(color: Colors.white,fontSize: 18)),
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => BarcodeScannerWidget()));
                    },
                ),
              ),

            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Drop-offs"),
            // Container(
            //   width: 50,
            //   height: 50,
            //   decoration: BoxDecoration(
            //       color:HexColor("#dbecf9"),
            //       shape:BoxShape.circle
            //   ),
            //   child: Icon(Icons.download_sharp,color: HexColor("#646464"),),
            // ),
            SizedBox(
              width: 10,
            ),
            Text("Pickups"),
            // Container(
            //   width: 50,
            //   height: 50,
            //   decoration: BoxDecoration(
            //     color:HexColor("#f9fac0"),
            //     shape:BoxShape.circle
            //   ),
            //   child: Icon(Icons.upload_rounded,color: HexColor("#646464"),),
            // ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        TripListView()
      ],
    );
  }
}
