import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_complete_guide/screens/splash_screen.dart';

import './screens/chat_screen.dart';
import './screens/auth_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterChat',
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          background: Colors.pink,
          secondary: Colors.red[400],
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        builder: (ctx, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting)
            return SplashScreen();

          if (userSnapshot.hasData) {
            return ChatScreen();
          }
          return AuthScreen();
        },
        stream: FirebaseAuth.instance.authStateChanges(),
      ),
    );
  }
}
