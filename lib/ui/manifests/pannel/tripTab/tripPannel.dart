import 'package:cloudofgoods/blocs/AlbumBloc.dart';
import 'package:cloudofgoods/models/album_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Trip extends StatefulWidget {
  @override
  _TripState createState() => _TripState();
}

class _TripState extends State<Trip> {
  var tripComplete = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    block.fetchAllAlbums();
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
            child: Text("Trips",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#636363"))),
          ),
        ),
        Container(
          child: Expanded(
            flex: 8,
            child: StreamBuilder(
              stream: block.allAlbum,
              builder: (BuildContext context, AsyncSnapshot<ListAlbumModel> snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.separated(
                    separatorBuilder: (BuildContext context, int index) => Divider(
                      color: Colors.black45,
                      indent: 10,
                      endIndent: 10,
                      height: 20,
                    ),
                    itemCount: snapshot.data.listOfAlbum.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                          "20180814_SF_AM",
                                          style: TextStyle(
                                              color: HexColor("#4ea2e2"),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Container(
                                            color: Colors.black12,
                                            height:1,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: HexColor("#cc90ee90"),//if incoming text is In-progress = #cc90ee90 , Not-started = #ccf0f0f0 , Completed-all success = #ccffdd9d , Completed-with failures = #ccff8989
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  offset: Offset(0, 2), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Text(
                                                  "In-Progress",textAlign: TextAlign.center,),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if(tripComplete) buttonStartOrStop("Start"),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor:
                                            HexColor("#dbecf9"),
                                            backgroundImage:
                                            NetworkImage(""),
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(5.0),
                                                child: Text(
                                                  "Drop-offs",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color: HexColor(
                                                          "#8a8a8a")),
                                                ),
                                              ),
                                              Text(
                                                "Items",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: HexColor(
                                                        "#636363")),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundColor:
                                              HexColor("#f9fac0"),
                                              backgroundImage:
                                              NetworkImage(""),
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(
                                                      5.0),
                                                  child: Text(
                                                    "Pickup",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: HexColor(
                                                            "#8a8a8a")),
                                                  ),
                                                ),
                                                Text(
                                                  "Items",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: HexColor(
                                                          "#636363")),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor:
                                            HexColor("#eaeaea"),
                                            backgroundImage:
                                            NetworkImage(""),
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(
                                                    5.0),
                                                child: Text(
                                                  "Other",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color: HexColor(
                                                          "#8a8a8a")),
                                                ),
                                              ),
                                              Text(
                                                "Items",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: HexColor(
                                                        "#636363")),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom:8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.13,
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
    );
  }

  Widget buttonStartOrStop(String value) {
    return Container(
      width: 100,
      height: 30,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: RaisedButton(
          padding: EdgeInsets.only(left: 15,right: 7),
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(7.0)),
          onPressed: () {},
          color: value == "Start"? Theme.of(context).accentColor:HexColor("#f5565e"),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                value,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),

              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
