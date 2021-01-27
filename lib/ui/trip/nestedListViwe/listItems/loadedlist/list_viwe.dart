import 'package:cloudofgoods/blocs/AlbumBloc.dart';
import 'package:cloudofgoods/models/album_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class TripListView extends StatefulWidget {
  @override
  _TripListViewState createState() => _TripListViewState();
}

class _TripListViewState extends State<TripListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    block.fetchAllAlbums();
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: block.allAlbum,
        builder: (BuildContext context, AsyncSnapshot<ListAlbumModel> snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              itemCount: snapshot.data.listOfAlbum.length,
              separatorBuilder: (_,__)=>const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.only(bottom:20,left: 5,right: 5),
                    leading: CircleAvatar(radius: 25,
                    backgroundImage: NetworkImage(snapshot.data.listOfAlbum[index].thumbnil),
                  ),
                  title: Text(snapshot.data.listOfAlbum[index].title,style:TextStyle(fontSize: 17),),
                  trailing: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: HexColor("#dbecf9"),
                        child: Text("03/05"),
                      ),
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: HexColor("#f9fac0"),
                        child: Text("02"),
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
