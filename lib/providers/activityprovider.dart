import 'dart:convert';

import 'package:crudapp/models/activity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:http/http.dart' as http;

part 'activityprovider.g.dart';

@riverpod
Future<Activity> activity(ActivityRef ref) async {
  const apiEndpoint = 'http://www.boredapi.com/api/activity/';
  final url = Uri.parse(apiEndpoint);

  final response = await http.get(url);

  final data = response.body;
  final Map<String, dynamic> decodedData = jsonDecode(data);
  
  return Activity.fromjson(decodedData);
}
