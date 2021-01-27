class AlbumModel {
  final int _albumId;
  final int _id;
  final String _title;
  final String _url;
  final String _thumbnil;

  AlbumModel(this._albumId, this._id, this._title, this._url, this._thumbnil);

  String get thumbnil => _thumbnil;

  String get url => _url;

  String get title => _title;

  int get id => _id;

  int get albumId => _albumId;



}

class ListAlbumModel{
  List<AlbumModel> _listOfAlbum = [];

  // ignore: missing_return
  ListAlbumModel.fromJson(List<dynamic> parsedjson){
    List<AlbumModel> _temp = [];
    for(var json in parsedjson){
     AlbumModel album = AlbumModel(json["albumId"], json["id"], json["title"], json["url"],json["thumbnailUrl"]);
     _temp.add(album);
    }
    _listOfAlbum = _temp;
  }

  List<AlbumModel> get listOfAlbum => _listOfAlbum;
}