// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UnrealData {
  UnrealData({
    required this.title,
    required this.body,
    required this.id,
    required this.userId,
  });

  final String title;
  final String body;
   int id;
  final int userId;

  factory UnrealData.fromJson(Map<String, dynamic> json) {
    return UnrealData(
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      id: json['id'] ?? 0,
      userId: json['userId'] ?? '',
    );
  }

  @override
  String toString() =>
      'UnrealData(title: $title, body: $body, userId: $userId)';
}

// class Post {
//   Post({
//     required this.userId,
//     required this.title,
//     required this.description,
//   });

//   final int userId;
//   final String title;
//   final String description;

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       userId: json['userId'],
//       title: json['title'],
//       description: json['description'],
//     );
//   }
// }
