import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:prueba_omni_pro/models/album_model.dart';

abstract class AlbumProvider {
  static Future<List<AlbumModel>> getAlbums({required int page}) async {
    final res = await AlbumProviderImpl.getAlbums(page: page);
    return res;
  }
}

class AlbumProviderImpl extends AlbumProvider {
  static Future<List<AlbumModel>> getAlbums({required int page}) async {
    const limit = 10;
    final path = 'https://jsonplaceholder.typicode.com/photos?_limit=$limit&_page=$page';
    final url = Uri.parse(path);
    List<AlbumModel> listAlbums = [];
    try {
      final response = await http.get(url);

      final jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

      for (final element in jsonResponse) {
        final albumTemp = AlbumModel.formApiResponse(element);
        listAlbums.add(albumTemp);
      }
      return listAlbums;
    } catch (e) {
      rethrow;
    }
  }
}
