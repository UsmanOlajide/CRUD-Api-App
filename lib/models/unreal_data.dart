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
