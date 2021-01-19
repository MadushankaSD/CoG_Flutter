import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';

class AllTab extends StatefulWidget {
  @override
  _AllTabState createState() => _AllTabState();
}

class _AllTabState extends State<AllTab>  with AutomaticKeepAliveClientMixin{
  Future<List<Album>> getAlbum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getAlbum=_getAlbum();
    });
  }

  Future<List<Album>> _getAlbum() async {
  var data = await http.get("https://jsonplaceholder.typicode.com/photos");
  var jsonData = json.decode(data.body);
  List<Album> album = [];
    for(var a in jsonData){
      Album album2 = Album(a["albumId"],a["id"],a["title"],a["url"],a["thumbnailUrl"]);
      album.add(album2);
    }
    return album;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

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
        builder: (BuildContext context,AsyncSnapshot snapshot) {
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
                  return Card(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 5),
                                  height: MediaQuery.of(context).size.height*0.09,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundImage: NetworkImage(
                                        snapshot.data[index].thumbnil
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:220,
                                  padding: EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  height: MediaQuery.of(context).size.height*0.09,
                                  child: Text(snapshot.data[index].title,
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height:30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: HexColor("#dbecf9")
                                  ),
                                  child: Center(
                                    child: Text(snapshot.data[index].id.toString()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height:30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: HexColor("#f9fac0")
                                  ),
                                  child: Center(
                                    child: Text(snapshot.data[index].id.toString()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
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

class Album{
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnil;

  Album(this.albumId, this.id, this.title, this.url, this.thumbnil);

}