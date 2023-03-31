import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_complete_guide/widgets/chats/messages.dart';
import 'package:flutter_complete_guide/widgets/chats/new_message.dart';

import '../helpers/apis.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterChat'),
        actions: [
          DropdownButton(
            underline: Container(),
            icon: const Icon(Icons.more_vert),
            items: [
              DropdownMenuItem(
                value: 'logout',
                child: Container(
                  child: const Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 8,
                      ),
                      Text('LOGOUT'),
                    ],
                  ),
                ),
              )
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}










// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// class ChatScreen extends StatelessWidget {
//   const ChatScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('chats/9sgF8GKhnFSYCK0iCrqv/messages')
//             .snapshots(),
//         builder: (ctx, streamSnapshot) {
//           if (streamSnapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return ListView.builder(
//             itemCount: streamSnapshot.data!.docs.length,
//             itemBuilder: (ctx, index) => Container(
//               padding: const EdgeInsets.all(8.0),
//               child: const Text('This Works'),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () async {
//           WidgetsFlutterBinding.ensureInitialized();
//           await Firebase.initializeApp();
//         },
//       ),
//     );
//   }
// }
