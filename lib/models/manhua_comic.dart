import 'package:belajar_flutter/models/comic.dart';

class Manhua extends Comic {
  bool _isColored = true; // khas manhua

  Manhua({
    required super.id,
    required super.title,
    required super.author,
    required super.description,
    required super.coverImage,
    required super.rating,
    required super.genres,
  });

  bool get isColored => _isColored;

  @override
  void displayInfo() {
    super.displayInfo();
    print("📍 Origin: China, Colored: $_isColored");
  }
}
