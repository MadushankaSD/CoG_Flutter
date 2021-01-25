import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class TopPanel extends StatefulWidget {
  @override
  _TopPanelState createState() => _TopPanelState();
}

class _TopPanelState extends State<TopPanel> {

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  var selectedvalue;
  var _citys = ["All cities","SriLanka", "India", "Canada", "San Francisco"];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: Container(
              child: Row(
                children: [
                  Text(
                    "Today",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                  IconButton(
                      color: Colors.blueAccent,
                      iconSize: MediaQuery.of(context).size.width * 0.07,
                      icon: FaIcon(FontAwesomeIcons.calendar),
                      tooltip: 'Pick a Date',
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext bulider) {
                            return Container(
                              width: double.infinity,
                              height:
                                  MediaQuery.of(context).copyWith().size.height / 3,
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                initialDateTime: DateTime.now(),
                                maximumYear: 2050,
                                minimumYear: 2000,
                                onDateTimeChanged: (DateTime newDate) {
                                    print(newDate);
                                },
                              ),
                            );
                          },
                        );
                      }),
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Text(
                  "AM",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                IconButton(
                    iconSize: MediaQuery.of(context).size.width * 0.07,
                    color: Colors.blueAccent,
                    icon: FaIcon(FontAwesomeIcons.clock),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext bulider) {
                          return Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).copyWith().size.height / 3,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.time,
                              initialDateTime: DateTime.now(),
                              onDateTimeChanged: (DateTime newDate) {
                                print(newDate);
                              },
                            ),
                          );
                        },
                      );
                    }),
              ],
            ),
          ),
          new Spacer(),
          Container(
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                onChanged: (value) {
                  setState(() {
                    selectedvalue = value;
                  });
                },
                hint: Text("All City"),
                dropdownColor: Colors.grey,
                value: selectedvalue,
                items: _citys.map((valueItems) {
                  return DropdownMenuItem(
                      value: valueItems, child: Text(valueItems));
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
