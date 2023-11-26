// ignore_for_file: public_member_api_docs, sort_constructors_first
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
}
