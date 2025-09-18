
import 'package:belajar_flutter/content/comic/comic.dart';

class AnimeComic extends Comic {
  final String author;
  final String chapter;

  AnimeComic({
    required super.title,
    required super.imageUrl,
    required this.author,
    required this.chapter,
  });

  @override
  String getInfo() {
    return "Anime Comic: $title • by $author • Chapter $chapter";
  }
}