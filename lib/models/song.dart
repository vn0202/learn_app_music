class Song {
  final String id;
  final String name;
  final String imagePath;
  final String singer;

  Song({
    required this.name,
    required this.imagePath,
    required this.singer,
    required this.id,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'].toString(),
      name: json['name'] ?? 'N/A',
      imagePath: json['imagePath'] ?? '',
      singer: json['singer'] ?? "N/A",
    );
  }
}
