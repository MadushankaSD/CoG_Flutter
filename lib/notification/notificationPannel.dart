import 'package:cloudofgoods/manifests/pannel/drawer.dart';
import 'package:flutter/material.dart';

class NotificationAll extends StatefulWidget {
  @override
  _NotificationAllState createState() => _NotificationAllState();
}

class _NotificationAllState extends State<NotificationAll> {
  var user= "madushanka";
  var delivery = "space 2";
  var qty = "32";
  var product = "bicycle";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notifications"),
      ),
      body: Container(
        child: Align(
          alignment: Alignment.topCenter,
          child: ListView.separated(
              reverse: true,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context,int index)=> Divider(
                color: Colors.black45,
                indent: 15,
                endIndent: 15,
                height: 25,
              ),
              // shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                // return ListTile(
                //   minVerticalPadding: 10,
                //   title: Text("Accept delivery reassignment request",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                //   subtitle: Padding(
                //     padding: const EdgeInsets.only(top: 5),
                //     child: Text("${this.user} is requesting to assign ${this.delivery} contains ${this.qty} of ${this.product},"),
                //   ),
                //
                // );
                return Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [

                      Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(child: Text("Pro qty of prod name",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:7),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text("${this.user} is requesting to assign ${this.delivery} contains ${this.qty} of ${this.product},",
                                        style: TextStyle(color: Colors.black45))
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("10:30PM",style: TextStyle(color: Colors.black38),),
                                  ClipPath(
                                    clipper: MyCliper(),
                                    child: Container(
                                      height: 25,
                                      width: 85,
                                      color: Colors.blue,
                                      child: Center(child: Text("Drop-off")),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class MyCliper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.moveTo(size.width,0);
    path.quadraticBezierTo(size.width*0.47,0,size.width*0.29,0);
    path.quadraticBezierTo(size.width*0.00,size.height*-0.00,0,size.height*0.50);
    path.quadraticBezierTo(size.width*0.00,size.height*1.00,size.width*0.29,size.height);
    path.quadraticBezierTo(size.width*0.47,size.height,size.width,size.height);
    path.lineTo(size.width,0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}