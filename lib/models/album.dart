// ignore_for_file: public_member_api_docs, sort_constructors_first
class Album {
  Album({
    // required this.userId,
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