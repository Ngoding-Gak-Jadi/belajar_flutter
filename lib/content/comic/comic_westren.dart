import 'package:belajar_flutter/content/comic/comic.dart';

class WesternComic extends Comic {
  final String publisher;
  final int issue;

  WesternComic({
    required super.title,
    required super.imageUrl,
    required this.publisher,
    required this.issue,
  });

  @override
  String getInfo() {
    return "Western Comic: $title • $publisher • Issue #$issue";
  }
}
