import 'package:flutter/material.dart';
import '../manifests/manifestPage.dart';
import '../notification/notificationPannel.dart';
import '../trip/tripPanelMain.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                      onTap: () {},
                      child:
                      Image.asset("assets/images/power_off.png",
                          height: MediaQuery.of(context).size.height*0.2,
                          width: MediaQuery.of(context).size.width * 0.5),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7),
                      child:Text("End Shift",style: TextStyle(fontSize: 17),),
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
}
