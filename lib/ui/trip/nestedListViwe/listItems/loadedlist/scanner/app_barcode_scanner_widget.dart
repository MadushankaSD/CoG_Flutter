import 'package:ai_barcode/ai_barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

///ScannerWidget
class BarcodeScannerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppBarcodeScannerWidgetState();
  }
}

class AppBarcodeScannerWidgetState extends State<BarcodeScannerWidget> {
  ScannerController _scannerController;
  String value = "";
  bool isFlashOn= false;
  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();

    var keyboardVisibilityController = KeyboardVisibilityController();

    keyboardVisibilityController.onChange.listen((bool visible) {
        setState(() {
          _keyboardVisible = visible;
        });
    });

    _scannerController = ScannerController(scannerResult: (result) {
      setState(() {
        value = result;
        FlutterBeep.beep();
      });
    }, scannerViewCreated: () {
      TargetPlatform platform = Theme.of(context).platform;
      if (TargetPlatform.iOS == platform) {
        Future.delayed(Duration(seconds: 2), () {
          _scannerController.startCamera();
          _scannerController.startCameraPreview();
        });
      } else {
        _scannerController.startCamera();
        _scannerController.startCameraPreview();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scannerController.stopCameraPreview();
    _scannerController.stopCamera();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Scan items"),
      ),
      body: Column(
      children: <Widget>[
        if(!_keyboardVisible) Container(
          height:MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width,
          child: _getScanWidgetByPlatform()
        ),
        Flexible(
          child: Padding(
              padding: const EdgeInsets.only(left: 17.0,right: 17.0,top: 17.0,bottom: 9.0),
              child: barcodeValue()
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                    flex: 3,
                    child: Container(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            value = "";
                          });
                          _scannerController.startCameraPreview();
                        },
                        child: CircleAvatar(
                          radius: 35,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 34,
                            child: Icon(Icons.refresh_outlined, size: 30,),
                          ),
                        ),
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: Container(
                      child: GestureDetector(
                        onTap: () {
                          // showDialog(
                          //     context: context,
                          //     builder: (context) =>
                          //         AlertDialog(
                          //           shape: RoundedRectangleBorder(
                          //               borderRadius: BorderRadius.all(
                          //                   Radius.circular(20))),
                          //           title: Text("Create Trip"),
                          //           content: TextField(
                          //             onChanged: (value) {
                          //               print(value);
                          //             },
                          //             controller: _textFieldController(),
                          //             decoration: InputDecoration(
                          //                 hintText: "Text Field in Dialog"),
                          //           ),
                          //           actions: [
                          //             FlatButton(
                          //                 onPressed: () {},
                          //                 child: Text("Create")),
                          //             FlatButton(
                          //                 onPressed: () =>
                          //                     Navigator.pop(context, false),
                          //                 child: Text("Cancel"))
                          //           ],
                          //         )
                          // );
                        },
                        child: CircleAvatar(
                            radius: 35,
                            child: Icon(Icons.check, size: 30,)
                        ),
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: Container(
                      child: Material(
                        child: GestureDetector(
                          onTap: (){
                            _scannerController.toggleFlash();
                            setState(() {
                              isFlashOn=_scannerController.isOpenFlash;
                            });
                            },
                          child: CircleAvatar(
                            radius: 35,
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 34,
                                child: Icon(!isFlashOn?Icons.flash_off_outlined:Icons.flash_on_outlined,size: 30,)
                            ),
                          ),
                        ),
                      ),
                    )),
                Expanded(flex: 1, child: Container()),
              ],
            ),
          ),
        ),
      ],
      )
    );
  }

  void openFlash(){

  }

  Widget _getScanWidgetByPlatform() {
    return PlatformAiBarcodeScannerWidget(
      platformScannerController: _scannerController,
    );
  }

  Widget barcodeValue() {
    return value.isEmpty? TextField(
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: "Scan or enter asset code",
      ),
      onSubmitted: (barcodeValue){
        setState(() {
          value=barcodeValue;
        });
        },
    ):
    Text(value,style: TextStyle(fontSize: 20),);
  }

}
