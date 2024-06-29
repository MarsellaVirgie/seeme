import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {
  final String imageUrl;
  final String description;

  PhotoWidget({required this.imageUrl, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(imageUrl),
        SizedBox(height: 8),
        Text(description, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
