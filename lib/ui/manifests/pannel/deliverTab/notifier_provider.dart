import 'package:flutter/material.dart';

class SingleNotifier extends ChangeNotifier{
  SingleNotifier();


  updateValue(){
    notifyListeners();
  }
}