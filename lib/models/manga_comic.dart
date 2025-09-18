import 'package:belajar_flutter/models/comic.dart';

class Manga extends Comic {
  String _readingDirection = "Right-to-Left"; 

  Manga({
    required super.id,
    required super.title,
    required super.author,
    required super.description,
    required super.coverImage,
    required super.rating,
    required super.genres,
  });

  String get readingDirection => _readingDirection;

  @override
  void displayInfo() {
    super.displayInfo();
    print("📍 Origin: Japan, Direction: $_readingDirection");
  }
}
