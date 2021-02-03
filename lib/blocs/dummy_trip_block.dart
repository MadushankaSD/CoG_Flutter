import 'dart:async';
import 'package:cloudofgoods/models/trip_model.dart';
import 'package:cloudofgoods/resources/repository.dart';
import 'package:rxdart/rxdart.dart';



final tripBlock = TripBlock();

class TripBlock {
  final _repository = Repository();
  final _tripFetcher = BehaviorSubject<List<AvaliableTrip>>();
  List<AvaliableTrip> _myTrip = [];

  // final _albumFetcher = ReplaySubject<ListAlbumModel>();

  dispose() {
    _tripFetcher.close();
  }

  Stream<List<AvaliableTrip>> get allTrip => _tripFetcher.stream;

    addToMyTrip(AvaliableTrip value) {
      _myTrip.add(value);
      print(_myTrip);
    }
    fetchAllTrips() async {
      List<AvaliableTrip> _tripList = await _repository.getTrips();
      _tripFetcher.sink.add(_tripList);
      // for (AvaliableTrip trip in _tripList) {
      //   _tripFetcher.sink.add(trip);
      // }
    }


    void removeFromMyTrip(AvaliableTrip value) {
      _myTrip.remove(value);
      print(_myTrip);
    }
}
