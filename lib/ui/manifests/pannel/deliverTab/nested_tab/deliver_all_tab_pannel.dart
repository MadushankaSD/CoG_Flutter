import 'package:cloudofgoods/blocs/AlbumBloc.dart';
import 'package:cloudofgoods/models/album_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../../../common/shape_cliper.dart';

class DeliverAllTab extends StatefulWidget {
  @override
  _DeliverAllTabState createState() => _DeliverAllTabState();
}

class _DeliverAllTabState extends State<DeliverAllTab>  with AutomaticKeepAliveClientMixin {
  Future<List<AlbumModel>> getAlbum;
  int selectedRadio;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio = 0;
    block.fetchAllAlbums();
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  // Future<void> _pullRefresh() async {
  //   setState(() {
  //     getAlbum = block.allAlbum;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: StreamBuilder(
        stream: block.allAlbum,
        builder: (BuildContext context, AsyncSnapshot<ListAlbumModel> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              separatorBuilder: (BuildContext context,int index)=> Divider(
                color: Colors.black45,
                indent: 10,
                endIndent: 10,
                height: 10,
              ),
              itemCount: snapshot.data.listOfAlbum.length,
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
                                    snapshot.data.listOfAlbum[index].thumbnil
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
            );
          }
         },
      ),
    );
  }
}





