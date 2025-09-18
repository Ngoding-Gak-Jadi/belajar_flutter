import 'package:flutter/material.dart';

class Comicnew {
  final String title;
  final String imageUrl;
  final String subtitle;

  Comicnew({required this.title, required this.imageUrl, this.subtitle = ''});

  Widget buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        if (subtitle.isNotEmpty)
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(0.9),
              fontSize: 13,
            ),
          ),
      ],
    );
  }
}
