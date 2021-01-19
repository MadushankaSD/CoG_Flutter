import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TripSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
        child: Column(
          children: [
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text("Trip summary",
                        style: TextStyle(
                            color: HexColor("#8a8a8a"),
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.black12,
                          height: 1,
                          width: 100,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(4),
                                  bottomLeft: Radius.circular(4)),
                              color: HexColor("#cc90ee90"),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(0,2)
                                )
                              ]
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text("Not started",textAlign: TextAlign.center,)
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor:
                          HexColor("#dbecf9"),
                          backgroundImage:
                          NetworkImage(""),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.all(5.0),
                              child: Text(
                                "Drop-offs",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.bold,
                                    color: HexColor(
                                        "#8a8a8a")),
                              ),
                            ),
                            Text(
                              "Items",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: HexColor(
                                      "#636363")),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor:
                            HexColor("#f9fac0"),
                            backgroundImage:
                            NetworkImage(""),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.all(
                                    5.0),
                                child: Text(
                                  "Pickup",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight:
                                      FontWeight.bold,
                                      color: HexColor(
                                          "#8a8a8a")),
                                ),
                              ),
                              Text(
                                "Items",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: HexColor(
                                        "#636363")),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor:
                          HexColor("#eaeaea"),
                          backgroundImage:
                          NetworkImage(""),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.all(
                                  5.0),
                              child: Text(
                                "Other",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.bold,
                                    color: HexColor(
                                        "#8a8a8a")),
                              ),
                            ),
                            Text(
                              "Items",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: HexColor(
                                      "#636363")),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
