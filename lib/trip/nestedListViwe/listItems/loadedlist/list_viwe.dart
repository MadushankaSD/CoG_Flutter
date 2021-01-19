import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../manifests/pannel/deliverTab/nested_tab/deliver_all_tab_pannel.dart';


class TripListView extends StatefulWidget {
  @override
  _TripListViewState createState() => _TripListViewState();
}

class _TripListViewState extends State<TripListView> {
  Future<List<Album>> getAlbum;

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
      Album album2 =
          Album(a["albumId"], a["id"], a["title"], a["url"], a["thumbnailUrl"]);
      album.add(album2);
    }
    return album;
  }

  bool get wantKeepAlive => true;

  Future<void> _pullRefresh() async {
    setState(() {
      getAlbum = _getAlbum();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.only(bottom:20,left: 5,right: 5),
                      leading: CircleAvatar(radius: 25,
                      backgroundImage: NetworkImage(snapshot.data[index].thumbnil),
                    ),
                    title: Text(snapshot.data[index].title,style:TextStyle(fontSize: 17),),
                    trailing: Wrap(
                      spacing: 10,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: HexColor("#dbecf9"),
                          child: Text("03/05"),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: HexColor("#f9fac0"),
                          child: Text("02"),
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
