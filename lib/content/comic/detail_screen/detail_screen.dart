import 'package:belajar_flutter/content/comic/comic.dart';
import 'package:belajar_flutter/content/comic/comic_anime.dart';
import 'package:belajar_flutter/content/comic/comic_mahwa.dart';
import 'package:belajar_flutter/content/comic/comic_westren.dart';
import 'package:flutter/material.dart';


class ComicDetailPage extends StatelessWidget {
  final Comic comic;

  const ComicDetailPage({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    String extraInfo = "";

    if (comic is AnimeComic) {
      final c = comic as AnimeComic;
      extraInfo = "Author: ${c.author}\nChapters: ${c.chapter}";
    } else if (comic is ManhwaComic) {
      final c = comic as ManhwaComic;
      extraInfo = "Artist: ${c.artist}\nStatus: ${c.status}";
    } else if (comic is WesternComic) {
      final c = comic as WesternComic;
      extraInfo = "Publisher: ${c.publisher}\nIssue: ${c.issue}";
    }

    return Scaffold(
      appBar: AppBar(title: Text(comic.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              comic.imageUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              comic.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              extraInfo,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
