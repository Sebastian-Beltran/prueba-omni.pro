import 'package:flutter/material.dart';
import 'package:prueba_omni_pro/models/album_model.dart';
import 'package:prueba_omni_pro/ui/widgets/custom_appbar.dart';
import 'package:prueba_omni_pro/ui/widgets/custom_drawer.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final album = ModalRoute.of(context)!.settings.arguments as AlbumModel;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: album.title,
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: size.width * 0.8,
              child: Image.network(album.url),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
