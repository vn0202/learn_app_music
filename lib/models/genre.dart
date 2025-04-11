class Genre {
  final String id;
  final String name;
  final String slug;
  final String thumb;

  Genre({
    required this.name,
    required this.slug,
    required this.thumb,
    required this.id,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      name: json['name'],
      slug: json['slug'],
      thumb: json['thumb'],
      id: json['id'].toString(),
    );
  }
}
