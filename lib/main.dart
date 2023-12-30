import 'dart:convert';

import 'package:crudapp/models/unreal_data.dart';
import 'package:crudapp/screens/homescreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

//* HERE I used Album endpoint and outputted just 1 album
//-------------------------------------
//* CRUD operations with the Album from JSONPLACEHOLDER API & IT WORKS ✅

//* FLUTTER VERSION
// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future<Album> fetchAlbum() async {
//   final response = await http.get(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
//   );

//   if (response.statusCode == 200) {
//     print(response.statusCode);
//     // If the server did return a 200 OK response, then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     // If the server did not return a 200 OK response, then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// Future<Album> deleteAlbum(String id) async {
//   final response = await http.delete(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
//     headers: {
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//   );
//   if (response.statusCode == 200) {
//     return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     throw Exception('Failed to delete album.');
//   }
// }

// class Album {
//   final int id;
//   final String title;

//   const Album({required this.id, required this.title});

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       // userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }

//   // factory Album.fromJson(Map<String, dynamic> json) {
//   //   return switch (json) {
//   //     {
//   //       'id': int id,
//   //       'title': String title,
//   //     } =>
//   //       Album(
//   //         id: id,
//   //         title: title,
//   //       ),
//   //     _ => throw const FormatException('Failed to load album.'),
//   //   };
//   // }
// }

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() {
//     return _MyAppState();
//   }
// }

// class _MyAppState extends State<MyApp> {
//   late Future<Album> _futureAlbum;

//   @override
//   void initState() {
//     super.initState();
//     _futureAlbum = fetchAlbum();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Delete Data Example',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Delete Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<Album>(
//             future: _futureAlbum,
//             builder: (context, snapshot) {
//               // If the connection is done,
//               // check for response data or an error.
//               if (snapshot.connectionState == ConnectionState.done) {
//                 if (snapshot.hasData) {
//                   final myData = snapshot.data!;
//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(myData.title),
//                       ElevatedButton(
//                         child: const Text('Get Data'),
//                         onPressed: () {
//                           setState(() {
//                             _futureAlbum = fetchAlbum();
//                           });
//                         },
//                       ),
//                       ElevatedButton(
//                         child: const Text('Delete Data'),
//                         onPressed: () {
//                           setState(() {
//                             _futureAlbum = deleteAlbum(myData.id.toString());
//                           });
//                         },
//                       ),
//                     ],
//                   );
//                 } else if (snapshot.hasError) {
//                   return Text('${snapshot.error}');
//                 }
//               }

//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
