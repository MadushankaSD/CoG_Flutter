import 'dart:async';
import 'package:cloudofgoods/models/album_model.dart';
import 'package:cloudofgoods/models/trip_model.dart';
import 'package:cloudofgoods/resources/api_provider/album_api_provider.dart';
import 'package:cloudofgoods/resources/api_provider/dummy_trip_provider.dart';

class Repository{
    final _albumProvider = AlbumProvider();
    final _tripProvider = GetAvaliableTrip();


    Future<ListAlbumModel> getAllAlbum() => _albumProvider.getAllAlbum();
    Future<List<AvaliableTrip>> getTrips() => _tripProvider.getAllTrip();

}