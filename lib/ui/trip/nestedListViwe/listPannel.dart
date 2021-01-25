import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';
import 'listItems/listItems.dart';

class TripList extends StatefulWidget {
  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  Future<List<Album>> getAlbum;

  Future<List<Album>> _getAlbum() async {
    var data = await http.get("https://jsonplaceholder.typicode.com/photos");
    var jsonData = json.decode(data.body);
    List<Album> album = [];
    for (var a in jsonData) {
      Album album2 =
          Album(a["albumId"], a["id"], a["title"], a["url"], a["thumbnailUrl"]);
      album.add(album2);
    }
    return album;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getAlbum = _getAlbum();
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _pullRefresh() async {
      setState(() {
        getAlbum = _getAlbum();
      });
    }

    return Expanded(
      flex: 1,
      child: FutureBuilder(
        future: getAlbum,
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.data == null){
            return Center(
              child: Text("Loading..."),
            );
          }else{
            return RefreshIndicator(
              onRefresh: _pullRefresh,
              child: ListView.separated(
                itemCount:20,
                separatorBuilder: (context,int index)=> Divider(
                  color: Colors.black45,
                  indent: 10,
                  endIndent: 10,
                  height: 10,
                ),
                itemBuilder: (context,int index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TripDetail(snapshot.data[index].id)),
                      );
                      },
                    child: Padding(
                      padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    child: Text("20180814_SF_AM",
                                        style: TextStyle(
                                          color: HexColor("#4ea2e2"),
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.black12,
                                        height: 1,
                                        width: 100,
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
                                              offset: Offset(0,2)
                                            )
                                          ]
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Text("Not started",textAlign: TextAlign.center,)
                                        ),
                                      ),
                                    ],
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
              ),
            );
          }
        },
      )
    );
  }
}

class Album {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnil;

  Album(this.albumId, this.id, this.title, this.url, this.thumbnil);
}
