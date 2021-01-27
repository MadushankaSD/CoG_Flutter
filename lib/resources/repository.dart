import 'dart:async';
import 'package:cloudofgoods/models/album_model.dart';
import 'package:cloudofgoods/resources/api_provider/album_api_provider.dart';

class Repository{
    final _albumProvider = AlbumProvider();

    Future<ListAlbumModel> getAllAlbum() => _albumProvider.getAllAlbum();
}