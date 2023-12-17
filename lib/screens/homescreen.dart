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

            //  Column(
            //   children: [
            //     const SizedBox(height: 80),
            //     const Text('TITLE'),
            //     const Text('updated'),
            //     const SizedBox(height: 30),
            //     const Text('BODY'),
            //     const Text('updated'),
            //     const SizedBox(height: 60),
            //     widget.buildButton(() async {}, 'GET'),
            //     widget.buildButton(() async {}, 'POST'),
            //     widget.buildButton(() async {}, 'UPDATE / PUT')
            //   ],
            // ),
            // listOfUnrealData.when(
            //   data: (listOfUnrealData) {
            //     // if (updated == false) {
            //     //   print(listOfUnrealData.last.id);
            //     // }

            //     var randomNumber = Random().nextInt(listOfUnrealData.length) + 1;
            //     var initialItem = listOfUnrealData[randomNumber];
            //     var newItem = listOfUnrealData.last;

            //     return SingleChildScrollView(
            //       child: Padding(
            //         padding: const EdgeInsets.all(10),
            //         child: Center(
            //             child: Column(
            //           children: [
            //             const SizedBox(height: 80),
            //             const Text('TITLE'),
            //             Text(updated ? initialItem.title : newItem.title),
            //             const SizedBox(height: 30),
            //             const Text('BODY'),
            //             Text(updated ? initialItem.body : newItem.body),
            //             const SizedBox(height: 60),
            //             NewPostScreen(
            //               userIdController: userIdController,
            //               titleController: titleController,
            //               bodyController: bodyController,
            //               idController: idController,
            //               // selectedItemId: selectedItemId,v
            //             ),
            //             const SizedBox(height: 10),
            // widget.buildButton(() async {
            //   await ref
            //       .read(listOfUnrealDataProvider.notifier)
            //       .getData();
            //   setState(() {});
            // }, 'GET'),
            // widget.buildButton(() async {
            //   await ref
            //       .read(listOfUnrealDataProvider.notifier)
            //       .postData(
            //         titleController.text,
            //         bodyController.text,
            //         int.tryParse(userIdController.text) ?? 0,
            //       );

            //   setState(() {
            //     updated = false;
            //   });
            //   userIdController.clear();
            //   titleController.clear();
            //   bodyController.clear();
            // }, 'POST'),

            // widget.buildButton(() async {
            //   await ref
            //       .read(listOfUnrealDataProvider.notifier)
            //       .updateData(
            //           int.tryParse(idController.text) ?? 0,
            //           titleController.text,
            //           bodyController.text,
            //           int.tryParse(userIdController.text) ?? 0);

            //   setState(() {});
            //   print(updated);
            // }, 'UPDATE / PUT')
            //           ],
            //         )),
            //       ),
            //     );
            //   },
            //   error: (e, s) {
            //     return const Center(
            //         child: Text('Oops, something unexpected happened'));
            //   },
            //   loading: () => const Center(child: Text('loading')),
            // ),
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

// 8270 01731 93

// wema bank lumos nigeria

                 //slayer insolense
                  // fov sync
                  // speed acceleration 160
                  // Malay 100k



// I'm just trying to sweeten up your day, but I'm afraid I might make you too sweet to handle 
//I'm just trying to spread a little sweetness in the world, and it seems to be working on you. 
//That's a win in my book.I guess a sweet mouth has its perks! 😄 
//Well, you know, a sweet mouth is just the beginning Haha, guilty as charged


// state not updating