import 'package:belajar_flutter/content/comic/comic.dart';
import 'package:belajar_flutter/content/comic/comic_anime.dart';
import 'package:belajar_flutter/content/comic/comic_mahwa.dart';
import 'package:belajar_flutter/content/comic/comic_westren.dart';
import 'package:belajar_flutter/content/comic/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final sampleComics = <Comic>[
    AnimeComic(
      title: "Naruto Shippuden",
      imageUrl: "assets/images/newcomic/bokuNoHero.png",
      author: "Masashi Kishimoto",
      chapter: "500",
    ),
    ManhwaComic(
      title: "Solo Leveling",
      imageUrl: "assets/images/newcomic/bokuNoHero.png",
      artist: "Chugong",
      status: "Completed",
    ),
    WesternComic(
      title: "Spider-Man",
      imageUrl: "assets/images/newcomic/bokuNoHero.png",
      publisher: "Marvel",
      issue: 25,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Comic Library")),
      body: ListView.builder(
        itemCount: sampleComics.length,
        itemBuilder: (context, index) {
          final comic = sampleComics[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              leading: Image.asset(
                comic.imageUrl,
                width: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) =>
                    const Icon(Icons.broken_image, size: 40),
              ),
              title: Text(comic.title),
              subtitle: Text(comic.getInfo()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ComicDetailPage(comic: comic),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
