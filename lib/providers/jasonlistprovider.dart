import 'dart:convert';

import 'package:crudapp/models/unreal_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'jasonlistprovider.g.dart';

const baseUrl = 'https://jsonplaceholder.typicode.com/posts';

@riverpod
class ListOfUnrealData extends _$ListOfUnrealData {
  @override
  Future<List<UnrealData>> build() async {
    final url = Uri.parse(baseUrl);

    final response = await http.get(url);

    final data = response.body;
    final List<dynamic> decodedData = jsonDecode(data);
    return decodedData
        .map((unrealData) => UnrealData.fromJson(unrealData))
        .toList();

        
  }

  Future<void> postData(String title, String body, int userId) async {
    final url = Uri.parse(baseUrl);
    final response = await http.post(
      url,
      headers: {'content-type': 'application/json'},
      body: jsonEncode(
        {
          'title': title,
          'body': body,
          'userId': userId,
        },
      ),
    );

    final data = response.body;
    final List<Map<String, dynamic>> decodedData = [jsonDecode(data)];

    final unrealData = UnrealData.fromJson(decodedData.first);

    final previousState = await future;

    state = AsyncData([...previousState, unrealData]);
  }
}
