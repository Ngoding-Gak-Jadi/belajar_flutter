import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryEntry {
  final String id; // doc id (usually comicId)
  final String title;
  final String? author;
  final String? coverImage;
  final String? description;
  final DateTime? openedAt;

  HistoryEntry({
    required this.id,
    required this.title,
    this.author,
    this.coverImage,
    this.description,
    this.openedAt,
  });

  factory HistoryEntry.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? {};
    final ts = data['openedAt'];
    DateTime? opened;
    if (ts is Timestamp) opened = ts.toDate();
    return HistoryEntry(
      id: doc.id,
      title: data['title'] as String? ?? 'Untitled',
      author: data['author'] as String?,
      coverImage: data['coverImage'] as String?,
      description: data['description'] as String?,
      openedAt: opened,
    );
  }

  Map<String, dynamic> toMap() => {
    'title': title,
    if (author != null) 'author': author,
    if (coverImage != null) 'coverImage': coverImage,
    if (description != null) 'description': description,
    'openedAt': FieldValue.serverTimestamp(),
  };
}
