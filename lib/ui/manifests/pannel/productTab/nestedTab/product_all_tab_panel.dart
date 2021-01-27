  import 'package:cloudofgoods/blocs/AlbumBloc.dart';
import 'package:cloudofgoods/models/album_model.dart';
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    block.fetchAllAlbums();
    super.build(context);
    return Container(
      child: StreamBuilder(
        stream: block.allAlbum,
        builder: (BuildContext context,AsyncSnapshot<ListAlbumModel> snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.listOfAlbum.length,
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
                                      snapshot.data.listOfAlbum[index].thumbnil
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
                                child: Text(snapshot.data.listOfAlbum[index].title,
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
                                  child: Text(snapshot.data.listOfAlbum[index].id.toString()),
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
                                  child: Text(snapshot.data.listOfAlbum[index].id.toString()),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                );
              },
            );
          }
        },
      ),
    );
  }
}