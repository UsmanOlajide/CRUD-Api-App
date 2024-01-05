import 'dart:math';

import 'package:crudapp/models/album.dart';
import 'package:crudapp/providers/%20albumprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Mode {
  initial,
  get,
  created,
}

class HomeScreen extends ConsumerStatefulWidget {
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
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  var a = 0;
  var notAdded = true;
  late Future<Album> albumFuture;
  late int randomNumber;

  @override
  void initState() {
    super.initState();
    randomNumber = Random().nextInt(100) + 1;
  }

  @override
  Widget build(BuildContext context) {
    final theAlbumProvider = ref.watch(albumProviderProvider);

    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('CRUD APP'),
          ),
          body: Center(
            child: theAlbumProvider.when(
              data: (album) {
                final secondRandomNumber = Random().nextInt(100) + 1;

                var initialAlbum = album[randomNumber];
                var getReqAlbum = album[secondRandomNumber];
                var addedAlbum = album.last;

                return Column(
                  children: [
                    const SizedBox(height: 80),
                    const Text('TITLE'),
                    if (a == 0) ...[
                      Text(initialAlbum.title)
                    ] else if (a == 1) ...[
                      Text(getReqAlbum.title)
                    ] else if (a == 2) ...[
                      Text(addedAlbum.title)
                    ] else if (a == 3) ...[
                      Text(notAdded ? initialAlbum.title : getReqAlbum.title)
                    ] else if (a == 4) ...[
                      Text(notAdded ? initialAlbum.title : getReqAlbum.title)
                    ],
                    const SizedBox(height: 30),
                    widget.buildButton(() async {
                      await ref.read(albumProviderProvider.notifier).getData();
                      setState(() {
                        a = 1;
                      });
                    }, 'GET'),
                    widget.buildButton(() async {
                      await ref.read(albumProviderProvider.notifier).sendData();
                      setState(() {
                        a = 2;
                      });
                    }, 'SEND/POST'),
                    widget.buildButton(() async {
                      await ref.read(albumProviderProvider.notifier).updateData(
                          notAdded ? initialAlbum.id : getReqAlbum.id);
                      setState(() {
                        a = 3;
                      });
                    }, 'UPDATE'),
                    widget.buildButton(() async {
                      await ref.read(albumProviderProvider.notifier).deleteData(
                          notAdded ? initialAlbum.id : getReqAlbum.id);
                      setState(() {
                        a = 4;
                      });
                    }, 'DELETE'),
                  ],
                );
              },
              error: (error, stackTrace) {
                return Center(
                  child: Text(error.toString()),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                  // child: Text('Loading...')
                );
              },
            ),
          ),
        ));
  }
}

//* Each time the app is started show a different content ✅
//* Whenever I press the GET button show different content too, It's just like manually doing it ... ✅
//* Whenever I press the POST button take the inputs and show it onto the screen ...


















//* My POST - Index = 100, length = 101

//* initial data with GET request = the origninal list 1-100
//* after i press the POST request = the original list + new item

//* GOALS
//* Each time the app is started show a different content ✅
//* Whenever I press the GET button show different content too, It's just like manually doing it ... ✅
//* Whenever I press the POST button take the inputs and show it onto the screen ...


            // child: FutureBuilder(
            //   future: albumFuture,
            //   // future: albumFuture ?? fetchData,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError) {
            //       print(snapshot.error);
            //     }
            //     if (snapshot.hasData) {
            //       // print(snapshot.data!.title);
            //       final oneData = snapshot.data;
            //       return Column(
            //         children: [
            //           const SizedBox(height: 80),
            //           const Text('TITLE'),
            //           Text(oneData?.title ?? 'DELETED'),
            //           const SizedBox(height: 30),
            //           widget.buildButton(() async {
            //             setState(() {
            //               albumFuture = networking.getData();
            //             });
            //           }, 'GET'),
            //           widget.buildButton(() async {
            //             setState(() {
            //               albumFuture = networking.postData('First Title');
            //             });
            //           }, 'POST'),
            //           widget.buildButton(() async {
            //             setState(() {
            //               albumFuture = networking.updateData('new title');
            //             });
            //           }, ' PUT / UPDATE'),
            //           widget.buildButton(() async {
            //             setState(() {
            //               albumFuture =
            //                   networking.deleteAlbum(oneData!.id.toString());
            //             });
            //           }, 'DELETE')
            //         ],
            //       );
            //     }

            //     return const Center(
            //       child: Text('Loading...'),
            //     );
            //   },
            // ),

            