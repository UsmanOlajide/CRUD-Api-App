class Post {
  Post({
    required this.title,
    required this.body,
    required this.id,
    required this.userId,
  });

  final String title;
  final String body;
  int id;
  final int userId;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      id: json['id'] ?? 0,
      userId: json['userId'] ?? '',
    );
  }


  @override
  String toString() =>
      'Post(title: $title, body: $body, userId: $userId)';
}
  // Map<String, dynamic> toMap() {
  //   return {
  //     'title': title,
  //     'body': body,
  //     'id': id,
  //     'userId': userId,
  //   };
  // }

  // String toJson() {
  //   return jsonEncode(toMap());
  // }
