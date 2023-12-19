import 'package:crudapp/models/album.dart';

import 'package:crudapp/services/networking.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  Widget buildButton(void Function()? onPressed, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black, foregroundColor: Colors.white),
      onPressed: onPressed,
      child: Text(text),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var updated = true;
  // var fetchData = networking.getData();
  late Future<Album> albumFuture;

  @override
  void initState() {
    super.initState();
    albumFuture = networking.getData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('CRUD APP'),
          ),
          body: Center(
            child: FutureBuilder(
              future: albumFuture,
              // future: albumFuture ?? fetchData,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                if (snapshot.hasData) {
                  // print(snapshot.data!.title);
                  final oneData = snapshot.data;
                  return Column(
                    children: [
                      const SizedBox(height: 80),
                      const Text('TITLE'),
                      Text(oneData?.title ?? 'DELETED'),
                      const SizedBox(height: 30),
                      widget.buildButton(() async {
                        setState(() {
                          albumFuture = networking.getData();
                        });
                      }, 'GET'),
                      widget.buildButton(() async {
                        setState(() {
                          albumFuture = networking.postData('First Title');
                        });
                      }, 'POST'),
                      widget.buildButton(() async {
                        setState(() {
                          albumFuture = networking.updateData('new title');
                        });
                      }, ' PUT / UPDATE'),
                      widget.buildButton(() async {
                        setState(() {
                          albumFuture =
                              networking.deleteAlbum(oneData!.id.toString());
                        });
                      }, 'DELETE')
                    ],
                  );
                }

                return const Center(
                  child: Text('Loading...'),
                );
              },
            ),
          ),
        ));
  }
}












//* My POST - Index = 100, length = 101

//* initial data with GET request = the origninal list 1-100
//* after i press the POST request = the original list + new item

//* GOALS
//* Each time the app is started show a different content ✅
//* Whenever I press the GET button show different content too, It's just like manually doing it ... ✅
//* Whenever I press the POST button take the inputs and show it onto the screen ...