import 'package:belajar_flutter/providers/favorites_provider.dart';
import 'package:belajar_flutter/widgets/comic_list_view.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          if (favoritesProvider.favorites.isEmpty) {
            return const Center(
              child: Text('No favorites yet!', style: TextStyle(fontSize: 18)),
            );
          }
          return ComicListView(comics: favoritesProvider.favorites);
        },
      ),
    );
  }
}
