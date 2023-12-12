import 'dart:convert';

import 'package:crudapp/models/unreal_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'jasonlistprovider.g.dart';

const getUrl = 'https://jsonplaceholder.typicode.com/posts';
const postUrl = 'https://jsonplaceholder.typicode.com/posts';
// late int lastItem;
// final lastItemString = lastItem.toString();
final updateUrl = 'https://jsonplaceholder.typicode.com/posts/1';

@riverpod
class ListOfUnrealData extends _$ListOfUnrealData {
  @override
  Future<List<UnrealData>> build() async {
    return getData();
  }

  Future<List<UnrealData>> getData() async {
    final url = Uri.parse(getUrl);
    final response = await http.get(url);
    print(response.statusCode);

    final data = response.body;
    final List<dynamic> decodedData = jsonDecode(data);
    return decodedData
        .map((unrealData) => UnrealData.fromJson(unrealData))
        .toList();
  }

  Future<void> postData(String title, String body, int userId) async {
    final url = Uri.parse(postUrl);
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

    // print(decodedData);

    final unrealData = UnrealData.fromJson(decodedData.first);

    final previousState = await future;

    state = AsyncData([...previousState, unrealData]);
  }

  // Future<void> updateData() async {
  Future<void> updateData(int id, String title, String body, int userId) async {
    final url = Uri.parse(updateUrl);
    final response = await http.put(
      url,
      body: jsonEncode(
        {
          'id': "101",
          'title': title,
          'body': body,
          'userId': userId,
        },
      ),
    );

    print(response.statusCode);
    // if (response.statusCode == 200) {
    // }
    final data = response.body;
    print(data);
    // final List<Map<String, dynamic>> decodedData = [jsonDecode(data)];

    // final unrealData = UnrealData.fromJson(decodedData.first);

    // final previousState = await future;

    // state = AsyncData([...previousState, unrealData]);
  }

}

// class ListOfUnrealData extends _$ListOfUnrealData {
//   @override
//   FutureOr<List<UnrealData>> build() async {
//     final url = Uri.parse(baseUrl);

//     final response = await http.get(url);
//     print(response.statusCode);
//     final data = response.body;
//     final List<dynamic> decodedData = jsonDecode(data);
//     return decodedData
//         .map((unrealData) => UnrealData.fromJson(unrealData))
//         .toList();
//   }

//   Future<void> postData(String title, String body, int userId) async {
//     final url = Uri.parse(baseUrl);
//     final response = await http.post(
//       url,
//       headers: {'content-type': 'application/json'},
//       body: jsonEncode(
//         {
//           'title': title,
//           'body': body,
//           'userId': userId,
//         },
//       ),
//     );

//     final data = response.body;
//     final List<Map<String, dynamic>> decodedData = [jsonDecode(data)];

//     final unrealData = UnrealData.fromJson(decodedData.first);

//     final previousState = await future;

//     state = AsyncData([...previousState, unrealData]);
//   }
// }
