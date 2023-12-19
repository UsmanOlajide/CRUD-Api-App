import 'dart:convert';
import 'dart:math';

import 'package:crudapp/models/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'postprovider.g.dart';

const getUrl = 'https://jsonplaceholder.typicode.com/posts';
const postUrl = 'https://jsonplaceholder.typicode.com/posts';
// late int lastItem;
// final lastItemString = lastItem.toString();
final updateUrl = 'https://jsonplaceholder.typicode.com/posts/1';

@riverpod
class PostData extends _$PostData {
  @override
  Future<Post> build() async {
    return fetchData();
  }

  Future<Post> fetchData() async {
    final url = Uri.parse(getUrl);
    final response = await http.get(url);
    print(response.statusCode);

    final data = response.body;
    final List<dynamic> decodedData = jsonDecode(data);
    final listOfPost = decodedData.map((e) => Post.fromJson(e)).toList();
    var randomNumber = Random().nextInt(decodedData.length) + 0;
    final post = listOfPost[randomNumber];
    print(post.title);
    return post;
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
  }
}

//     final data = response.body;

//     final List<Map<String, dynamic>> decodedData = [jsonDecode(data)];

//     // print(decodedData);

//     final Post = Post.fromJson(decodedData.first);

//     final previousState = await future;

//     state = AsyncData([...previousState, Post]);
//   }

//   // Future<void> updateData() async {
//   Future<void> updateData( String title, String body, int userId) async {
//     final url = Uri.parse(updateUrl);
//     final response = await http.put(
//       url,
//       body: jsonEncode(
//         {
//           // 'id': id,
//           'title': title,
//           'body': body,
//           'userId': userId,
//         },
//       ),
//     );

//     print(response.statusCode);
//     // if (response.statusCode == 200) {
//     // }
//     final data = response.body;
//     print(data);
//     // final List<Map<String, dynamic>> decodedData = [jsonDecode(data)];

//     // final Post = Post.fromJson(decodedData.first);

//     // final previousState = await future;

//     // state = AsyncData([...previousState, Post]);
//   }

// }

// class ListOfPost extends _$ListOfPost {
//   @override
//   FutureOr<List<Post>> build() async {
//     final url = Uri.parse(baseUrl);

//     final response = await http.get(url);
//     print(response.statusCode);
//     final data = response.body;
//     final List<dynamic> decodedData = jsonDecode(data);
//     return decodedData
//         .map((Post) => Post.fromJson(Post))
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

//     final Post = Post.fromJson(decodedData.first);

//     final previousState = await future;

//     state = AsyncData([...previousState, Post]);
//   }
// }
