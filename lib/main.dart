import 'package:crudapp/screens/homescreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

// * TESTING/ NEW UI

//* So far I changed the UI to show only one unrealData at a time but random every time the app is started or a GET request is made
//* I added a POST feature which adds the user input to the list of all unrealData and after the request the user input is displayed
//* Next up is the UPDATE feature, I think find & update by ID is good to use, but I'm still working on it ...
//* Next up is the DELETE feature, I did that already in the norivepod branch working with an Album & not Posts