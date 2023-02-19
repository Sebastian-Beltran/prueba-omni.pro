import 'package:flutter/material.dart';
import 'package:prueba_omni_pro/models/album_model.dart';
import 'package:prueba_omni_pro/provider/album_provider.dart';
import 'package:prueba_omni_pro/ui/widgets/card_album.dart';

class ListAlbums extends StatefulWidget {
  const ListAlbums({super.key});

  @override
  State<ListAlbums> createState() => _ListAlbumsState();
}

class _ListAlbumsState extends State<ListAlbums> {
  final ScrollController scrollController = ScrollController();
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;
  List<AlbumModel> listAlbums = [];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AlbumProvider.getAlbums(page: page),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final albums = snapshot.data;
            if (albums != null) {
              listAlbums = listAlbums + albums;
              final albumsToSet = listAlbums.toSet().toList();
              return ListView.builder(
                itemCount: albumsToSet.length + 1,
                itemBuilder: (context, i) {
                  if (i < albumsToSet.length) {
                    return CardAlbum(album: albumsToSet[i]);
                  } else {
                    return const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
                controller: scrollController,
              );
            } else {
              return const Text('Error');
            }
          } else {
            return const Text('Error');
          }
        });
  }

  void _scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      page++;
      AlbumProvider.getAlbums(page: page);
      setState(() {});
    } else {}
  }
}
