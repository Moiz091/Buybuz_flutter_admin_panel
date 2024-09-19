import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:web_admin/views/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: kIsWeb || Platform.isAndroid
          ? FirebaseOptions(
              apiKey: "AIzaSyAZ8YuFZsNM1x0ULC2-f6ca-LUkUuk6F5E",
              appId: "AIzaSyAZ8YuFZsNM1x0ULC2-f6ca-LUkUuk6F5E",
              messagingSenderId: "467034985816",
              projectId: "market-place-912f8",
              storageBucket: "market-place-912f8.appspot.com")
          : null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
      builder: EasyLoading.init(),
    );
  }
}
