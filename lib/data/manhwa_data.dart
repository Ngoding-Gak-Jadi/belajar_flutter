// lib/data/manhwa_data.dart
import 'package:belajar_flutter/models/manhwa_comic.dart';

import '../models/comic.dart';

List<Comic> manhwaList = [
  Manhwa(
    id: "mh1",
    title: "Solo Leveling",
    status: 'completed',
    author: "Chugong",
    description: "Seorang hunter lemah menjadi hunter terkuat dengan sistem misterius.",
    coverImage: "https://upload.wikimedia.org/wikipedia/en/5/5f/Solo_Leveling_webtoon.jpg",
    rating: 4.9,
    genres: ["Action", "Fantasy"],
  ),
  Comic(
    id: "mh2",
    title: "Tower of God",
    author: "SIU",
    description: "Petualangan Bam yang menaiki menara misterius demi menemukan temannya, Rachel.",
    coverImage: "https://upload.wikimedia.org/wikipedia/en/0/0e/Tower_of_God_Volume_1_Cover.jpg",
    rating: 4.7,
    genres: ["Adventure", "Fantasy", "Mystery"],
  ),
  Comic(
    id: "mh3",
    title: "The God of High School",
    status: 'complted',
    author: "Yongje Park",
    description: "Turnamen bela diri yang menyimpan rahasia besar tentang dewa dan kekuatan mistis.",
    coverImage: "https://upload.wikimedia.org/wikipedia/en/d/d6/God_of_High_School_webtoon_volume_1_cover.png",
    rating: 4.6,
    genres: ["Action", "Martial Arts", "Supernatural"],
  ),
];
