import 'package:circular_check_box/circular_check_box.dart';
import 'package:cloudofgoods/blocs/dummy_trip_block.dart';
import 'package:cloudofgoods/models/trip_model.dart';
import 'package:cloudofgoods/notifires/notifires_delivery.dart';
import 'package:cloudofgoods/ui/common/shape_cliper.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class DeliverOpenTab extends StatefulWidget {
  @override
  _DeliverOpenTabState createState() => _DeliverOpenTabState();
}

class _DeliverOpenTabState extends State<DeliverOpenTab> with AutomaticKeepAliveClientMixin{

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tripBlock.fetchAllTrips();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _multipleTripNotifier=Provider.of<MultipleTripNotifier>(context);
    return Container(
      child: StreamBuilder(
        stream: tripBlock.allTrip,
        builder: (BuildContext context, AsyncSnapshot<List<AvaliableTrip>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              separatorBuilder: (BuildContext context,int index) {
                 if (snapshot.data[index].open) return Divider(
                  color: Colors.black45,
                  indent: 10,
                  endIndent: 10,
                  height: 20,
                );
                 return SizedBox();
              },
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext ctx, int index) {
                if(snapshot.data[index].open) return Container(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // checkBoxCircular(_multipleTripNotifier,snapshot,index),
                            CircularCheckBox(
                              value: _multipleTripNotifier.isHaveValue(snapshot.data[index].tripId) ,
                              checkColor: Colors.white,
                              activeColor: Colors.green,

                              onChanged: (value) {
                                value ? _multipleTripNotifier.addTrip(
                                    snapshot.data[index]) :
                                _multipleTripNotifier.removeItem(
                                    snapshot.data[index]);
                              },

                            )
                          ],
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Flexible(child: Text(
                                      snapshot.data[index].productListDetail,
                                      style: TextStyle(fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45)))
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Flexible(child: Text(
                                      snapshot.data[index].data,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black45)))
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Flexible(child: Text(
                                      snapshot.data[index].address,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black45)))
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
                                  color: HexColor("#abd2f0"),
                                  child: Center(child: Padding(
                                    padding: const EdgeInsets.only(left: 9),
                                    child: Text("Drop-off",
                                      style: TextStyle(color: Colors.black87),),
                                  )),
                                ),
                              ),
                              SizedBox(height: 10,),
                              // Container(
                              //   alignment: Alignment.bottomCenter,
                              //   child: CircleAvatar(
                              //     radius: 20,
                              //     backgroundImage: NetworkImage(
                              //         snapshot.data.listOfAlbum[index].thumbnil
                              //     ),
                              //   ),
                              // ),
                              SizedBox(height: 10,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                return SizedBox();
                },
            );
          }
        },
      ),
    );
  }
}
