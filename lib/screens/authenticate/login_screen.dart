import 'package:flutter/material.dart';
import 'package:flutter_dev_challenge/screens/home/home_page.dart';
import 'package:flutter_dev_challenge/services/auth.dart';

import '../../constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(kDefPadding),
          child: Column(
            children: [
              const Spacer(),
              Text(
                'Welcome to Log in Screen',
                style: kCaptionText,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              buildEmailFormField(),
              const SizedBox(height: 8),
              buildPasswordFormField(),
              SizedBox(height: kDefPadding * 2),
              InkWell(
                onTap: () async {
                  print('email: $email');
                  print('passwoerd: $password');
                  dynamic result = await _auth.signIn(email, password);
                  print('sonuc : $result');

                  if (result != null) {
                    Route route = MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    });
                    Navigator.push(context, route);
                  } else {
                    // calismiyor
                    const SnackBar(
                      content: Text('something went wrong'),
                      behavior: SnackBarBehavior.floating,
                    );
                  }
                },
                borderRadius: BorderRadius.circular(25),
                child: createButton('Log in'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a word';
        } else {
          email = value;
        }
      },
      onChanged: (value) {
        email = value;
      },
      decoration: inputDecoration('E-mail'),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a word';
        } else {
          password = value;
        }
      },
      onChanged: (value) {
        password = value;
      },
      decoration: inputDecoration('Password'),
    );
  }
}
