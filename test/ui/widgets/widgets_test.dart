import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_omni_pro/models/album_model.dart';
import 'package:prueba_omni_pro/ui/widgets/card_album.dart';
import 'package:prueba_omni_pro/ui/widgets/custom_appbar.dart';
import 'package:prueba_omni_pro/ui/widgets/custom_drawer.dart';
import 'package:prueba_omni_pro/ui/widgets/error_widget.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group('Testing UI widgets', () {
    testWidgets('Testing CustomAppBar widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: CustomAppBar(title: 'Test title'),
          ),
        ),
      );
      final titleFinder = find.text('Test title');

      expect(titleFinder, findsOneWidget);
    });
    testWidgets('Testing CustomErrorWidget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: CustomErrorWidget(),
          ),
        ),
      );
      final titleFinder = find.text('Error al traer la información');

      expect(titleFinder, findsOneWidget);
    });
    testWidgets('Testing cardAlbum widget', (tester) async {
      const album = AlbumModel(
        almbunId: 1,
        id: 1,
        title: 'Album test',
        url: 'https://via.placeholder.com/600/92c952',
        thumbnailUrl: 'https://via.placeholder.com/600/92c952',
      );
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Material(
              child: CardAlbum(
                album: album,
              ),
            ),
          ),
        );
        final titleFinder = find.text('Album test');

        expect(titleFinder, findsOneWidget);
      });
    });
    testWidgets('Testing CustomDrawer widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: CustomDrawer(),
          ),
        ),
      );
      final titleFinder = find.text('Prueba tecnica omni.pro');

      expect(titleFinder, findsOneWidget);
    });
  });
}
