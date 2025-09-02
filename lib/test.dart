// import 'package:carz_app/config/dependeces.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class TestScreen extends StatelessWidget {
//   const TestScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Test")),

//       body: Consumer(
//         builder: (c, ref, r) {
//           print('build');
//           return Center(
//             child: Column(
//               children: [
//                 Text(ref.watch(testProvider)),
//                 SizedBox(height: 100.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     ref.read(testProvider.notifier).update("d");
//                   },
//                   child: Text('update'),
//                 ),
//                 SizedBox(height: 10.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     ref.read(testProvider.notifier).clear();
//                   },
//                   child: Text('clear'),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
