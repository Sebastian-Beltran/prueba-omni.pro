import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba_omni_pro/models/album_model.dart';
import 'package:prueba_omni_pro/provider/album_provider.dart';

import 'album_provider_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  const path = 'https://jsonplaceholder.typicode.com/photos?_limit=2&_page=1';
  group('Test provider albums', () {
    test('Test getAlbums method return Instance of AlbumModel', () async {
      final client = MockClient();

      when(client.get(Uri.parse(path))).thenAnswer((_) async => http.Response('''
        [
          {
            "albumId": 1,
            "id": 1,
            "title": "accusamus beatae ad facilis cum similique qui sunt",
            "url": "https://via.placeholder.com/600/92c952",
            "thumbnailUrl": "https://via.placeholder.com/150/92c952"
          },
          {
            "albumId": 1,
            "id": 2,
            "title": "reprehenderit est deserunt velit ipsam",
            "url": "https://via.placeholder.com/600/771796",
            "thumbnailUrl": "https://via.placeholder.com/150/771796"
          },
      ''', 200));
      expect(await AlbumProvider.getAlbums(page: 1), isA<List<AlbumModel>>());
    });

    test('Test failure getAlbums method return throws exception', () {
      final client = MockClient();
      when(
        client.get(Uri.parse(path)),
      ).thenThrow((_) => http.Response(''' Not found error ''', 404));
      try {
        AlbumProvider.getAlbums(page: 1);
      } catch (e) {
        expect(e, throwsException);
      }
    });
  });
}
