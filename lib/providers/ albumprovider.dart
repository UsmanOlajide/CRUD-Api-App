import 'dart:convert';

import 'package:crudapp/models/album.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part ' albumprovider.g.dart';

@riverpod
class AlbumProvider extends _$AlbumProvider {
  @override
  FutureOr<List<Album>> build() {
    return getData();
  }

  Future<List<Album>> getData() async {
    const getUrl = 'https://jsonplaceholder.typicode.com/albums';

    final url = Uri.parse(getUrl);
    final response = await http.get(url);

    final data = response.body;
    final List<dynamic> decodedData = jsonDecode(data);

    final albumList =
        decodedData.map((album) => Album.fromJson(album)).toList();
    return albumList;
  }

  Future<void> sendData() async {
    const postUrl = 'https://jsonplaceholder.typicode.com/albums';

    final url = Uri.parse(postUrl);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'title': 'A new title'}),
    );

    final data = response.body;
    final Map<String, dynamic> decodedData = jsonDecode(data);

    final album = Album.fromJson(decodedData);

    final previousState = await future;

    state = AsyncData([...previousState, album]);
    state.value!.last.title;
  }

  Future<void> updateData(int id) async {
    final baseUrl =
        'https://jsonplaceholder.typicode.com/albums/${id.toString()}';
    //* Api AlbumList 100 items , index in dart 0-99
    //* after POST request 101 , index in dart 0-100

    final url = Uri.parse(baseUrl);
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'id': id,
        'title': 'Updated title',
      }),
    );

    final data = response.body;
    final Map<String, dynamic> decodedData = jsonDecode(data);

    final updatedAlbum = Album.fromJson(decodedData);

    var secondState = state.value!;
    secondState[id - 1] = updatedAlbum;

    state = AsyncData([...secondState]);
  }

  Future<void> deleteData(int id) async {
    final deleteUrl =
        'https://jsonplaceholder.typicode.com/posts/${id.toString()}';

    final url = Uri.parse(deleteUrl);
    final response = await http.delete(url);

    final Map<String, dynamic> decodedData = jsonDecode(response.body);

    final deletedAlbum = Album.fromJson(decodedData);

    var secondState = state.value!;
    secondState[id - 1] = deletedAlbum;

    state = AsyncData([...secondState]);
  }
}
