import 'package:belajar_flutter/content/new_comic.dart';
import 'package:flutter/material.dart';

class AnimeComic extends Comicnew {
  final String author;
  final String chapter;

  AnimeComic({
    required super.title,
    required super.imageUrl,
    super.subtitle = '',
    required this.author,
    required this.chapter,
  });

  @override
  Widget buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$title - Ch $chapter",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "By $author",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          // ignore: deprecated_member_use
          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13),
        ),
      ],
    );
  }
}
