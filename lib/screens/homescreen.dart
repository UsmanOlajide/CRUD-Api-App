import 'dart:math';

import 'package:crudapp/providers/postprovider.dart';
import 'package:flutter/material.dart';

import 'package:crudapp/widgets/newpost_screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  final userIdController = TextEditingController();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  // final idController = TextEditingController();
  var updated = true;
  // int i = 0;

  @override
  void dispose() {
    userIdController.dispose();
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postData = ref.watch(postDataProvider);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CRUD APP'),
        ),
        body: postData.when(
          data: (post) {
              print(post.title);
            // if (updated == false) {
            //   print(post.title);
            // }
            // var randomNumber = Random().nextInt(post.length) + 0;
            // final post = post[randomNumber];

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                    child: Column(
                  children: [
                    const SizedBox(height: 80),
                    const Text('TITLE'),
                    Text(post.title),
                    // Text(updated ? initialItem.title : newItem.title),
                    const SizedBox(height: 30),
                    const Text('BODY'),
                    Text(post.body),
                    // Text(updated ? initialItem.body : newItem.body),
                    const SizedBox(height: 60),
                    NewPostScreen(
                      userIdController: userIdController,
                      titleController: titleController,
                      bodyController: bodyController,
                      // idController: idController,
                      // selectedItemId: selectedItemId,v
                    ),
                    const SizedBox(height: 10),
                    widget.buildButton(() async {
                      await ref.read(postDataProvider.notifier).fetchData();
                      setState(() {});
                      // updated = false;
                    }, 'GET'),
                    // widget.buildButton(() async {
                    //   await ref
                    //       .read(listOfUnrealDataProvider.notifier)
                    //       .post(
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
                    //           // int.tryParse(idController.text) ?? 0,
                    //           titleController.text,
                    //           bodyController.text,
                    //           int.tryParse(userIdController.text) ?? 0);

                    //   setState(() {});
                    //   print(updated);
                    // }, 'UPDATE / PUT')
                  ],
                )),
              ),
            );
          },
          error: (e, s) {
            return const Center(
                child: Text('Oops, something unexpected happened'));
          },
          loading: () => const Center(child: Text('loading')),
        ),
      ),
    );
  }
}






// I dont want to input the id manually, i just want to pass the id of the current post 





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
