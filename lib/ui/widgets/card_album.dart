import 'package:flutter/material.dart';
import 'package:prueba_omni_pro/models/album_model.dart';

class CardAlbum extends StatelessWidget {
  const CardAlbum({
    super.key,
    required this.album,
  });

  final AlbumModel album;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(20),
        title: Text(album.title),
        leading: Image.network(album.thumbnailUrl),
        onTap: () => Navigator.pushNamed(
          context,
          'album',
          arguments: album,
        ),
      ),
    );
  }
}
