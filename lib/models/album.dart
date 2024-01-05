class Album {
  Album({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
    );
  }
}

//* Where else could I handle the response if the json response is null