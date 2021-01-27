import 'package:cloudofgoods/blocs/AlbumBloc.dart';
import 'package:cloudofgoods/models/album_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';

class Trip extends StatefulWidget {
  @override
  _TripState createState() => _TripState();
}

class _TripState extends State<Trip> {

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
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      color: Colors.black45,
                      indent: 10,
                      endIndent: 10,
                      height: 10,
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
                                      flex: 1,
                                      child: Container(
                                        child: Text(
                                          "20180814_SF_AM",
                                          style: TextStyle(
                                              color: HexColor("#4ea2e2"),
                                              fontSize: 14,
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
                                              borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(4),
                                                  bottomLeft: Radius.circular(4)),
                                              color: HexColor("#cc90ee90"),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  offset: Offset(0, 2), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Text(
                                                "Completed",textAlign: TextAlign.center,),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 40),
                                          child: Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: HexColor("#5bafee"),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Center(
                                                child: Text(
                                              "Start  >",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
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
}
