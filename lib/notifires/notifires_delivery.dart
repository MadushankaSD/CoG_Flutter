import 'package:flutter/material.dart';

class SingleNotifier extends ChangeNotifier {
  Trip _selected_trip = tripList[0];
  SingleNotifier();

  Trip get getSelectedTrip => _selected_trip;

  updateTrip(Trip trip){
    if(trip != _selected_trip){
      trip.isSelected = true;
      _selected_trip.isSelected = false;
      _selected_trip = trip;
      notifyListeners();
    }
  }

}

class Trip {
  final String tripId;
  bool isSelected;

  Trip(this.tripId, this.isSelected);

  @override
  String toString() {
    return 'Trip{tripId: $tripId, isSelected: $isSelected}';
  }
}

final List<Trip> tripList = [
  Trip("1 st trip", false),
  Trip("2 st trip", false),
  Trip("3 st trip", false),
  Trip("ds st trip", false),
  Trip("das st trip", false),
  Trip("asf st trip", false),
  Trip("4 st trip", false)
];


class MultipleTripNotifier extends ChangeNotifier {
  List<AvaliableTrip> _selectedTrips;
  MultipleTripNotifier(this._selectedTrips);

  List<AvaliableTrip> get selectedTrips => _selectedTrips;

  bool isHaveValue(AvaliableTrip value) => _selectedTrips.contains(value);

  addTrip(AvaliableTrip value){
    if(!isHaveValue(value)){
      _selectedTrips.add(value);
      notifyListeners();
    }
  }

  removeItem(AvaliableTrip value){
    if(isHaveValue(value)){
      _selectedTrips.remove(value);
      notifyListeners();
    }
  }
}

