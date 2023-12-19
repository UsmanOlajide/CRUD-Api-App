// import 'dart:convert';

// import 'package:crudapp/models/unreal_data.dart';
// import 'package:http/http.dart' as http;

// class Networking {
//   final baseUrl = 'https://jsonplaceholder.typicode.com/posts';
//   final updatedList = [];

//   Future<List<UnrealData>> getAllData() async {
//     final url = Uri.parse(baseUrl);
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       print(response.statusCode);
//       final data = response.body;
//       final List<dynamic> decodedData = jsonDecode(data);
//       return decodedData
//           .map((unrealData) => UnrealData.fromJson(unrealData))
//           .toList();
//     } else {
//       throw Exception('Failed to load');
//     }
//   }

//   Future<void> postSomething(String title, String body, int userId) async {
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
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final Map<String, dynamic> newPost = jsonDecode(response.body);
//       print(response.statusCode);
//       print(newPost);
//       //  postProvider.addPost(newPost);
//     } else
//       print('failed');
//   }
// }

// final networking = Networking();
