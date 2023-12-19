import 'dart:convert';
import 'dart:math';

import 'package:crudapp/models/album.dart';
import 'package:crudapp/models/unreal_data.dart';
import 'package:http/http.dart' as http;

class Networking {
  final baseUrl = 'https://jsonplaceholder.typicode.com/albums';
  // final updateUrl = 'https://jsonplaceholder.typicode.com/posts/101';

  final updatedList = [];

// returns a list
  // Future<List<UnrealData>> getData() async {
  //   final url = Uri.parse(baseUrl);
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     print(response.statusCode);
  //     final data = response.body;
  //     final List<dynamic> decodedData = jsonDecode(data);
  //     return decodedData
  //         .map((unrealData) => UnrealData.fromJson(unrealData))
  //         .toList();
  //   } else {
  //     throw Exception('Failed to load');
  //   }
  // }

// returns just one object
  Future<Album> getData() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.statusCode);
      final data = response.body;
      final List<dynamic> decodedData = jsonDecode(data);

      final albumList =
          decodedData.map((album) => Album.fromJson(album)).toList();
      var randomNumber = Random().nextInt(albumList.length) + 0;
      final album = albumList[randomNumber];
      // print('id:${album.id}');
      // print('userId:${album.userId}');
      return album;
    } else {
      throw Exception('Failed to load');
    }
  }

  //_________________________________
  Future<Album> postData(String title) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(
        {
          'title': title,
        },
      ),
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> newPost = jsonDecode(response.body);
      print(response.statusCode);
      print(newPost);
      return Album.fromJson(newPost);
      // return UnrealData.fromJson(newPost);
      //  postProvider.addPost(newPost);
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<Album> updateData(String title) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(
        {
          'title': title,
        },
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> newPost = jsonDecode(response.body);
      print(response.statusCode);
      print(newPost);
      return Album.fromJson(newPost);
    } else {
      throw Exception('${response.statusCode} : failed');
    }
  }

  Future<Album> deleteAlbum(String id) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/albums/$id');
    final response = await http.delete(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> deletedAlbum = jsonDecode(response.body);
      // print(response.statusCode);
      print(deletedAlbum);
      return Album.fromJson(deletedAlbum);
    } else {
      throw Exception('${response.statusCode} : failed');
    }
  }
}

final networking = Networking();


//1h30m 2h 1h50m