import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(height: 60),
          Text('Error al traer la información'),
          SizedBox(height: 20),
          Icon(
            Icons.error,
            size: 40,
          )
        ],
      ),
    );
  }
}
