import 'package:belajar_flutter/models/comic.dart';

class Manhwa extends Comic {
  String _readingDirection = "Top-to-Bottom"; // khas manhwa

  Manhwa({
    required super.id,
    required super.title,
    required super.author,
    required super.description,
    required super.coverImage,
    required super.rating,
    required super.genres,
    super.status,
  });

  String get readingDirection => _readingDirection;

  @override
  Map<String, dynamic> getAdditionalInfo() {
    return {
      ...super.getAdditionalInfo(),
      'Origin': 'Korea 📍',
      'Reading Direction': _readingDirection,
    };
  }

  @override
  String getType() => 'Manhwa';
}
