import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class API {
  //static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
}



















//     return StreamBuilder(
//       stream: FirebaseFirestore.instance
//           .collection('chats/9sgF8GKhnFSYCK0iCrqv/messages')
//           .snapshots(),
//       builder: (ctx, streamSnapshot) {
//         if (streamSnapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         return ListView.builder(
//           itemCount: streamSnapshot.data!.docs.length,
//           itemBuilder: (ctx, index) => Container(
//             padding: const EdgeInsets.all(8.0),
//             child: const Text('This Works'),
//           ),
//         );
//       },
//     );
//   }
// }
