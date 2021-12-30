import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_challenge/constants.dart';
import 'package:flutter_dev_challenge/screens/authenticate/signup_screen.dart';

import 'authenticate/login_screen.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              Text(
                'Welcome to Flutter Developer Challenge App',
                style: kCaptionText,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Route route = MaterialPageRoute(builder: (context) {
                    return const SignUp();
                  });
                  Navigator.push(context, route);
                },
                borderRadius: BorderRadius.circular(25),
                child: createButton('Sign Up'),
              ),
              SizedBox(height: kDefPadding),
              InkWell(
                onTap: () {
                  Route route = MaterialPageRoute(builder: (context) {
                    return const Login();
                  });
                  Navigator.push(context, route);
                },
                borderRadius: BorderRadius.circular(25),
                child: createButton('Log In'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
