import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_barcode_scanner_widget.dart';

///
/// CustomSizeScannerPage
class CustomSizeScannerPage extends StatefulWidget {
  @override
  _CustomSizeScannerPageState createState() => _CustomSizeScannerPageState();
}

class _CustomSizeScannerPageState extends State<CustomSizeScannerPage> {
  String _code = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Trips"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("this is test"),
            ],
          ),
          Container(
            width: 300,
            height: 400,
            child: AppBarcodeScannerWidget.defaultStyle(
              resultCallback: (String code) {
                setState(() {
                  _code = code;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
