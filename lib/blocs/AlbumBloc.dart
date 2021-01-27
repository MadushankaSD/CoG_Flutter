import 'dart:async';
import 'package:cloudofgoods/models/album_model.dart';
import 'package:cloudofgoods/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class AlbumBloc{
   final _repository = Repository();
   final _albumFetcher = BehaviorSubject<ListAlbumModel>();
   // final _albumFetcher = ReplaySubject<ListAlbumModel>();

   dispose(){
     _albumFetcher.close();
   }

   Stream<ListAlbumModel> get allAlbum => _albumFetcher.stream;

   fetchAllAlbums() async {
      ListAlbumModel albumList = await _repository.getAllAlbum();
        _albumFetcher.sink.add(albumList);
   }
}

final block = AlbumBloc();