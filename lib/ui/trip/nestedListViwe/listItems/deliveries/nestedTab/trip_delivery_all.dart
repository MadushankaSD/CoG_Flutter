import 'package:cloudofgoods/blocs/AlbumBloc.dart';
import 'package:cloudofgoods/models/album_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../../common/shape_cliper.dart';


class TripDeliveryAll extends StatefulWidget  {
  @override
  _TripDeliveryAllState createState() => _TripDeliveryAllState();
}

class _TripDeliveryAllState extends State<TripDeliveryAll> with AutomaticKeepAliveClientMixin{
  bool isExpanded = false;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    block.fetchAllAlbums();
  }

  // Future<void> _pullRefresh() async {
  //   setState(() {
  //     getAlbum = _getAlbum();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: StreamBuilder(
        stream: block.allAlbum,
        builder: (BuildContext context, AsyncSnapshot<ListAlbumModel> snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (BuildContext context,int index)=> Divider(
                color: Colors.black,
                indent: 20,
                endIndent: 20,
                height: 30,
              ),
              itemCount: snapshot.data.listOfAlbum.length,
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
            );
          }
        },
      ),
    );
  }
}
