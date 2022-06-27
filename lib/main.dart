import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:kommunicate_flutter/kommunicate_flutter.dart';

import './ui/authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        accentColor: Colors.black,
        highlightColor: Colors.orange,
      ),
      title: 'BTM',
      home: Authentication(),
    );
  }
}

