import 'package:flutter/material.dart';

class TestClip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipPath(
          clipper: MyCliper(),
          child: Container(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange,Colors.deepOrange],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight
              )
            ),
          )
      ),
    );
  }
}

class MyCliper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.moveTo(0,0);
    path.lineTo(size.width,0);
    path.lineTo(size.width,size.height);
    path.lineTo(0,size.height);
    path.lineTo(size.width*0.25,size.height*0.50);
    path.lineTo(0,0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
