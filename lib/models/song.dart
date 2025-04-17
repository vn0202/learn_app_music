class Song {
  final String id;
  final String name;
  final String imagePath;
  final String singer;
  List? availableTranslations;
  List<Map<String, dynamic>>? tranlations = [];
  Song({
    required this.name,
    required this.imagePath,
    required this.singer,
    required this.id,
    this.tranlations,
    this.availableTranslations,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'].toString(),
      name: json['name'] ?? 'N/A',
      imagePath: json['imagePath'] ?? '',
      singer: json['singer'] ?? "N/A",
      tranlations: json['tranlations'] ?? [],
      availableTranslations: json['availableTranslations'] ?? [],
    );
  }
}
