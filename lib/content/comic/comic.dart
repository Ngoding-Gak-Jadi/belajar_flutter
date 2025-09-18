class Comic {
  final String title;
  final String imageUrl;

  Comic({required this.title, required this.imageUrl});

  String getInfo() {
    return "Comic: $title";
  }
}
