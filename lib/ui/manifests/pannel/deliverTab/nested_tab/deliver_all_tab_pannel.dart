import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../common/shape_cliper.dart';

class DeliverAllTab extends StatefulWidget {
  @override
  _DeliverAllTabState createState() => _DeliverAllTabState();
}

class _DeliverAllTabState extends State<DeliverAllTab>  with AutomaticKeepAliveClientMixin {
  Future<List<Album>> getAlbum;
  int selectedRadio;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio = 0;
    setState(() {
      getAlbum = _getAlbum();
    });
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
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
                  color: Colors.black45,
                  indent: 10,
                  endIndent: 10,
                  height: 10,
                ),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 1.2,
                              child: Radio(value: 0,
                                  focusColor: Colors.blue,
                                  // splashRadius: 10,
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
                            children: [
                              Row(
                                children: [
                                  Flexible(child: Text("Pro qty of prod name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black45)))
                                ],
                              ),
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
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ClipPath(
                                clipper: MyCliper(),
                                child: Container(
                                  height: 25,
                                  width: 85,
                                  color: Colors.blue,
                                  child: Center(child: Text("Drop-off")),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      snapshot.data[index].thumbnil
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,)
                            ],
                          ),
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




class Album {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnil;

  Album(this.albumId, this.id, this.title, this.url, this.thumbnil);
}
