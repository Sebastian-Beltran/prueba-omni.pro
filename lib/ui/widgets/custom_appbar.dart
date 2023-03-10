import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    super.key,
    this.bottom,
    this.elevation = 1,
  });

  final String title;
  final PreferredSizeWidget? bottom;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(
            Icons.menu,
            size: 40,
            color: Colors.black,
          ),
        );
      }),
    );
  }

  @override
  Size get preferredSize {
    if (bottom == null) {
      return const Size.fromHeight(56.0);
    }
    return Size.fromHeight(56.0 + bottom!.preferredSize.height);
  }
}
