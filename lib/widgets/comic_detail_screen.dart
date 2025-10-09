import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// firebase handled by HistoryProvider
import '../providers/history_provider.dart';
import '../models/comic.dart';
import '../models/chapter.dart';
import '../providers/favorites_provider.dart';
import '../screens/chapter_detail_screen.dart';
import '../data/chapter_data.dart';

class ComicDetailScreen extends StatefulWidget {
  final Comic comic;

  ComicDetailScreen({super.key, required this.comic});

  @override
  State<ComicDetailScreen> createState() => _ComicDetailScreenState();
}

class _ComicDetailScreenState extends State<ComicDetailScreen> {
  late final List<Chapter> chapters;

  @override
  void initState() {
    super.initState();
    chapters = getSampleChapters(widget.comic.id);
    // Defer provider call until after the first frame so context is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        final history = context.read<HistoryProvider>();
        history.addEntry(
          id: widget.comic.id,
          title: widget.comic.title,
          author: widget.comic.author,
          description: widget.comic.description,
          coverImage: widget.comic.coverImage,
        );
      } catch (_) {
        // provider not registered or other error - ignore silently
      }
    });
  }

  // history is now handled via HistoryProvider

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.comic.coverImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.broken_image, size: 50),
                  );
                },
              ),
              title: Text(
                widget.comic.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              titlePadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'By ${widget.comic.author}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            widget.comic.rating.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'Genres',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.comic.genres.map((genre) {
                      return Chip(
                        label: Text(genre),

                        // ignore: deprecated_member_use
                        backgroundColor: Colors.blue.withOpacity(0.1),
                        labelStyle: const TextStyle(color: Colors.blue),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...widget.comic.getAdditionalInfo().entries.map((entry) {
                    return Row(
                      children: [
                        Text("${entry.key}: "),
                        Text(entry.value.toString()),
                      ],
                    );
                  }),

                  const SizedBox(height: 24),

                  const Text(
                    'Synopsis',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.comic.description,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: Consumer<FavoritesProvider>(
                          builder: (context, favoritesProvider, child) {
                            final isFavorite = favoritesProvider.isFavorite(
                              widget.comic,
                            );
                            return ElevatedButton.icon(
                              onPressed: () {
                                favoritesProvider.toggleFavorite(widget.comic);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      isFavorite
                                          ? 'Removed from favorites'
                                          : 'Added to favorites',
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              },
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.pink : null,
                              ),
                              label: Text(
                                isFavorite
                                    ? 'Remove from Favorites'
                                    : 'Add to Favorites',
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (chapters.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChapterDetailScreen(
                                    chapter: chapters[0],
                                    allChapters: chapters,
                                  ),
                                ),
                              );
                            }
                          },
                          icon: const Icon(Icons.book),
                          label: const Text('Start Reading'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Chapters',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: chapters.length,
                    itemBuilder: (context, index) {
                      final chapter = chapters[index];
                      return ListTile(
                        title: Text(chapter.title),
                        subtitle: Text('Chapter ${chapter.chapterNumber}'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterDetailScreen(
                                chapter: chapter,
                                allChapters: chapters,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
