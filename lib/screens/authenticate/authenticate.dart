import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_challenge/screens/home/home_page.dart';

import '../../constants.dart';
import '../first_page.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // Initialize FlutterFire:
      stream: FirebaseAuth.instance.authStateChanges(),

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: kMainColor,
            ),
          );
        } else if (snapshot.hasData) {
          return const HomePage();
        }
        // Check for errors
        else if (snapshot.hasError) {
          return const Center(child: Text('Something Went Wrong'));
        } else {
          return const FirstPage();
        }
      },
    );
  }
}
