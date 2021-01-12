import 'package:flutter/material.dart';

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
              Hero(
                tag: 'splash',
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
                        child: Image.asset('assets/images/cloud_of_goods.png',
                            width: MediaQuery.of(context).size.width * 0.7))),
              ),
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
                            Navigator.of(context).pushReplacementNamed('manifest');
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
                              print('Trip Clicked');
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
                      Navigator.of(context).pushReplacementNamed('notification');
                    },
                    child: Image.asset("assets/images/notification.png",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7),
                    child:Text("Notification",style: TextStyle(fontSize: 17),),
                  )
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
