import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../../models/album_model.dart';

class AlbumProvider {
    Client client = Client();

    Future<ListAlbumModel> getAllAlbum() async {
      final responceData = await client.get("https://jsonplaceholder.typicode.com/photos");
    if (responceData.statusCode == 200){
         final parsed_data = jsonDecode(responceData.body).cast<Map<String,dynamic>>();
         return ListAlbumModel.fromJson(parsed_data);
      }else{
        throw Exception("Failed to load post");
      }
    }

}

