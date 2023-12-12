// import 'package:crudapp/models/unreal_data.dart';
// import 'package:crudapp/providers/jasonlistprovider.dart';
// import 'package:crudapp/widgets/newpost_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class HomeBody extends StatelessWidget {
//   const HomeBody({super.key, required this.listOfUnrealData});

//   final List<UnrealData> listOfUnrealData;

//   Widget buildButton(void Function()? onPressed, String text) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.black, foregroundColor: Colors.white),
//       onPressed: onPressed,
//       child: Text(text),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('POSTS'),
//             ],
//           ),
//           Center(
//             child: Column(
//               children: [
//                 const SizedBox(height: 80),
//                 const Text('TITLE'),
//                 Text(listOfUnrealData.first.title),
//                 const SizedBox(height: 30),
//                 const Text('BODY'),
//                 Text(listOfUnrealData.first.body),
//                 const SizedBox(height: 60),
//                 const NewPostScreen(),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                     onPressed: () {
//                       ref.read(listOfUnrealDataProvider);
//                     },
//                     child: Text('Get')),
//                 buildButton(() {}, 'POST'),
//                 buildButton(() {}, 'UPDATE'),
//                 buildButton(() {}, 'DELETE'),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
