import 'package:crudapp/screens/newpost_screen.dart';
import 'package:crudapp/widgets/home_body.dart';

import 'package:flutter/material.dart';

import '../services/networking.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD APP'),
      ),
      body: FutureBuilder(
        future: networking.getAllData(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final listOfUnrealData = snapshot.data!.reversed.toList();
            return HomeBody(listOfUnrealData: listOfUnrealData);
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('There was an error loading Top Headlines'),
            );
          }
          return const Center(
            child: Text('Loading...'),
          );
        },
      ),
    );
  }
}
