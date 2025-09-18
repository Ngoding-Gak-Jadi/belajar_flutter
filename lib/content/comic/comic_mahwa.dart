

import 'package:belajar_flutter/content/comic/comic.dart';

class ManhwaComic extends Comic {
  final String artist;
  final String status;

  ManhwaComic({
    required super.title,
    required super.imageUrl,
    required this.artist,
    required this.status,
  });

  @override
  String getInfo() {
    return "Manhwa: $title • Artist $artist • $status";
  }
}