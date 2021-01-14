import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_button/group_button.dart';
import 'package:hexcolor/hexcolor.dart';

class LoadList extends StatefulWidget {
  @override
  _LoadListState createState() => _LoadListState();
}

class _LoadListState extends State<LoadList> {

  var colour = HexColor("#4ea2e2");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          child: GroupButton(
            spacing: 30,
            isRadio: true,
            direction: Axis.horizontal,
            buttons:[
              "Load Items",
              "Unload Items"
            ],
            selectedTextStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white,
            ),
            unselectedTextStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.lightBlueAccent,
            ),
            selectedColor: Colors.lightBlueAccent,
            // borderRadius: BorderRadius.circular(5.0),
            selectedShadow: <BoxShadow>[
              BoxShadow(color: Colors.transparent)
            ],
          )
        )
      ],
    );
  }
}
