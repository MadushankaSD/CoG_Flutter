import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TripHeader extends StatefulWidget {
  final String header;

  TripHeader(this.header);

  @override
  _TripHeaderState createState() => _TripHeaderState();
}

class _TripHeaderState extends State<TripHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(super.widget.header,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: HexColor("#636363")),),
        )
      ],
    );
  }
}
