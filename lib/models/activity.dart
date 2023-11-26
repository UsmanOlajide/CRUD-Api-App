// ignore_for_file: public_member_api_docs, sort_constructors_first
class Activity {
  Activity({
    required this.activity,
    required this.type,
    required this.key,
    required this.participants,
    required this.price,
  });

  final String activity;
  final String type;
  final String key;
  final int participants;
  final double price;

  factory Activity.fromjson(Map<String, dynamic> json) {
    return Activity(
      activity: json['activity'],
      type: json['type'],
      key: json['key'],
      participants: json['participants'],
      price: json['price'],
    );
  }
}
