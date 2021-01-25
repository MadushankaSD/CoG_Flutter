import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../../common/shape_cliper.dart';
import '../../../../../manifests/pannel/deliverTab/nested_tab/deliver_all_tab_pannel.dart';

class TripDeliveryAll extends StatefulWidget  {
  @override
  _TripDeliveryAllState createState() => _TripDeliveryAllState();
}

class _TripDeliveryAllState extends State<TripDeliveryAll> with AutomaticKeepAliveClientMixin{

  bool isExpanded = false;

  Future<List<Album>> getAlbum;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getAlbum = _getAlbum();
    });
  }

  Future<List<Album>> _getAlbum() async {
    var data = await http.get("https://jsonplaceholder.typicode.com/photos");
    var jsonData = json.decode(data.body);
    List<Album> album = [];
    for (var a in jsonData) {
      Album album2 = Album(a["albumId"], a["id"], a["title"], a["url"], a["thumbnailUrl"]);
      album.add(album2);
    }
    return album;
  }

  Future<void> _pullRefresh() async {
    setState(() {
      getAlbum = _getAlbum();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: FutureBuilder(
        future: getAlbum,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text("Loading..."),
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: _pullRefresh,
              child: ListView.separated(
                separatorBuilder: (BuildContext context,int index)=> Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                  height: 30,
                ),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 1,
                              child: Radio(
                                  value: 0,
                                  focusColor: Colors.blue,
                                  // splashRadius: 8,
                                  groupValue: 1,
                                  onChanged: (val){

                                  }
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  Flexible(
                                      child: Text(
                                          "This is sample of dummy dasd fkajhf sadtaydt asdyayd sdgajdg sdgaj",
                                          // maxLines: this.isExpanded ? sample.length : 2,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45)
                                      )
                                  )
                                ],
                              ),
                              SizedBox(height: 3,),
                              Row(
                                children: [
                                  Flexible(child: Text("8.00 AM - 11.00 AM",style: TextStyle(fontSize: 16,color: Colors.black45)))
                                ],
                              ),
                              Row(
                                children: [
                                  Flexible(child: Text("041 Towne Square Apt.309",style: TextStyle(fontSize: 16,color: Colors.black45)))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            ClipPath(
                              clipper: MyCliper(),
                              child: Container(
                                height: 25,
                                width: 85,
                                color: HexColor("#dbecf9"),
                                child: Center(child: Text("Drop-off")),
                              ),
                            ),
                            SizedBox(height: 30,)
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
