// import 'dart:math';

// void main(List<String> arguments) async {
//   final apiList = [1, 2, 3, 4, 5];
//   final myList = [0, 1, 2, 3, 4];

//   final randomNumber = Random().nextInt(2);
//   print('item ${myList[randomNumber]}');
//   print('index : ${myList[randomNumber]}');
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Tester extends ConsumerStatefulWidget {
  const Tester({super.key});

  @override
  ConsumerState<Tester> createState() => _TesterState();
}

class _TesterState extends ConsumerState<Tester> {
  @override
  Widget build(BuildContext context) {
  var updated = true;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Olajide'),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    updated = false;
                  });
                },
                child: Text('Change'))
          ],
        ),
      ),
    );
  }
}
  //  if (updated == false) {
  //     print('it is false');
  //   }
// void main(List<String> args) async {
//   await futura();
//   print('hahaa');
// }

// Future<String> futura() async {
//   await Future.delayed(Duration(seconds: 5));
//   return 'completed';
// }
