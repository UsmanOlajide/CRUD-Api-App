// import 'dart:math';

// void main(List<String> arguments) async {
//   final apiList = [1, 2, 3, 4, 5];
//   final myList = [0, 1, 2, 3, 4];

//   final randomNumber = Random().nextInt(2);
//   print('item ${myList[randomNumber]}');
//   print('index : ${myList[randomNumber]}');
// }
//* latest
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class Playground extends StatelessWidget {
//   const Playground({super.key});
//   final a = 20;
//   @override
//   Widget build(BuildContext context) {
//     var updated = true;
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (a < 20) ...[
//               Text('a is less than 20')
//             ] else if (a > 20) ...[
//               Text('a is greater than 20')
//             ] else ...[
//               Text('a is 20')
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }


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
