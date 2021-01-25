import 'package:cloudofgoods/common/connection_class.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../manifests/manifestPage.dart';
import '../notification/notificationPannel.dart';
import '../trip/tripPanelMain.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;
  String color_of_switch='#33000000';
  bool start_shift;
  bool unload_van=true;

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() {
        _source = source;
        _source.keys.toList()[0]==ConnectivityResult.none?color_of_switch='#33000000':color_of_switch='#97cf49';
      });
    });
  }

  @override
  void dispose() {
    _connectivity.disposeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
          child:Container(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
                      child: Image.asset('assets/images/cloud_of_goods.png',
                          width: MediaQuery.of(context).size.width * 0.7))),
              SizedBox(height: 2,),
              Text(
                "Control Center",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.08),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context){
                              return Manifests();
                            }));
                          },
                          child: Column(
                            children: [
                              ClipRRect(
                                child: Image.asset(
                                  "assets/images/manifest.png",
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(top: 7),
                                child:Text("Manifests",style: TextStyle(fontSize: 17),),
                              )

                            ],
                          ),
                        )
                    ),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context){
                                return TripMain();
                              }));
                            },
                            child: Column(
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    "assets/images/drivers.png",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child:Text("Trip",style: TextStyle(fontSize: 17),),
                                )
                              ],

                            ))),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                            onTap: () {
                              print('Driver Clicked');
                            },
                            child: Column(
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    "assets/images/driver.png",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child:Text("Drivers",style: TextStyle(fontSize: 17),),
                                )
                              ],
                            )
                        )
                    ),
                  ],
                ),
              ),
              Padding(
              child:Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context){
                        return NotificationAll();
                      }));
                    },
                    child:Stack(
                      children: [
                        Image.asset("assets/images/notification.png",),
                        Positioned(
                          top: 0,
                          right: 6,
                          child: Container(
                            height: 25,
                            width: 25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                )
                              ]
                            ),
                            child: Text("3",style: TextStyle(color: Colors.white),),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7),
                    child:Text("Notification",style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
            ),
              Padding(
                child:  Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx)=>
                              showAlertDialog(ctx),
                        );
                      },
                      child: Container(
                        child: CircleAvatar(
                          backgroundColor: HexColor(color_of_switch.toString()),
                          radius: MediaQuery.of(context).size.height*0.08,
                          child: ClipRRect(
                            child: Container(
                                padding: EdgeInsets.only(top:0),
                                width: MediaQuery.of(context).size.height*0.13,
                                height: MediaQuery.of(context).size.height*0.13,
                                child: Image.asset("assets/images/power_button/drawable-xhdpi/start_bitton_active.png")),
                          ),
                          // backgroundImage: AssetImage(""),

                        ),
                      ),
                      // child: Image.asset("assets/images/power_off.png",
                      //     height: MediaQuery.of(context).size.height*0.2,
                      //     width: MediaQuery.of(context).size.width * 0.5),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7),
                      child:Text(color_of_switch=='#97cf49'?"Start Shift":"End Shift",style: TextStyle(fontSize: 17),),
                    )
                  ],
                ),
                padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.07)
            ),
            ],
          ),

        )),
      );

  }

  Widget showAlertDialog(ctx) {
    return color_of_switch == "#33000000" ?showAlert(ctx, "Connection Problem", "Please check your internet connection",'','Ok'): color_of_switch == "#f5565e" && unload_van == true ?
    showAlert(ctx, "End shift", "Are you sure want to end shift?",'Yes','Cancle'):color_of_switch == "#f5565e" && unload_van == false ? showAlert(ctx, "Unload items", "Please unload the van before you end your shift",'','Got It'):showAlert(ctx, "Start shift", "Are you sure want to start shift", "Yes", "Cancle");
    }

  Widget showAlert(ctx,String hedding,String message,String buttonOneMEssage,String buttonTwoMessage){
    return AlertDialog(
      title: Text(hedding),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          Divider(),
        ],
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(20))),
      actions: <Widget>[
        if(buttonOneMEssage != '')FlatButton(child: Text(buttonOneMEssage),
            onPressed: () {
              setState(() {

                if (color_of_switch=='#97cf49'){
                  start_shift=true;
                  color_of_switch= '#f5565e';
                }else if (color_of_switch=='#f5565e'){
                  if(unload_van==false){

                  }else {
                    start_shift = false;
                    color_of_switch = '#97cf49';
                  }
                }
              });
              Navigator.of(ctx).pop();
            },
          ),

        if(buttonTwoMessage != '') FlatButton(child: Text(buttonTwoMessage),
          onPressed: (){
            Navigator.of(ctx).pop();
          },
        ),
      ],
      // actionsOverflowButtonSpacing: 50,
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
