import 'package:flutter/material.dart';
import 'package:flutter_dev_challenge/services/auth.dart';
import '../../constants.dart';
import '../home/home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isAccepted = false;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
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
                'Welcome to Sign Up Screen',
                style: kCaptionText,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              buildEmailFormField(),
              const SizedBox(height: 12), //getProportionateScreenWidth(20)),
              buildPasswordFormField(),
              SizedBox(height: kDefPadding * 2),
              InkWell(
                onTap: () async {
                  // if (_formKey.currentState.validate()) {
                  print('email: $email');
                  print('passwoerd: $password');
                  dynamic result = await _auth.signUp(email, password);
                  if (_isAccepted && result != null) {
                    Route route = MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    });
                    Navigator.push(context, route);
                  } else if (result == null) {
                    setState(() {
                      error = 'Please supply a valid email';
                    });
                  }
                  // }
                },
                borderRadius: BorderRadius.circular(25),
                child: createButton('Register'),
              ),
              const SizedBox(height: 8),
              SwitchListTile(
                title: const Text('Accept the Term of Use and Conditions'),
                value: _isAccepted,
                onChanged: (bool value) {
                  setState(() {
                    _isAccepted = value;
                  });
                },
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
