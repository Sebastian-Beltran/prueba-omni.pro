import 'package:flutter/material.dart';
import 'package:prueba_omni_pro/ui/album_screen.dart';
import 'package:prueba_omni_pro/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        'album': (context) => const AlbumScreen(),
      },
    );
  }
}
