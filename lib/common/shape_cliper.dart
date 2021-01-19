import 'package:flutter/material.dart';

class MyCliper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.moveTo(0,0);
    path.lineTo(size.width,0);
    path.lineTo(size.width,size.height);
    path.lineTo(0,size.height);
    path.lineTo(size.width*0.13,size.height*0.50);
    path.lineTo(0,0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}