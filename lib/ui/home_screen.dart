import 'package:flutter/material.dart';
import 'package:prueba_omni_pro/ui/widgets/custom_appbar.dart';
import 'package:prueba_omni_pro/ui/widgets/custom_drawer.dart';
import 'package:prueba_omni_pro/ui/widgets/list_albums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Home Omni.pro'),
      drawer: CustomDrawer(),
      body: ListAlbums(),
    );
  }
}
