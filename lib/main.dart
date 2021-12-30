import 'package:flutter/material.dart';
import 'package:flutter_dev_challenge/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dev_challenge/screens/authenticate/authenticate.dart';

// void main() {
//   runApp(const MyApp());
// }
// 
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Developer Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kMainColor,
      ),
      home: const Authenticate(),
    );
  }
}
