// ignore_for_file: avoid_print

import 'package:cat_task/screens/login_screen/application_item.dart';
import 'package:cat_task/screens/login_screen/user_data.dart';
import 'package:cat_task/screens/signin_screen/view.dart';
import 'package:cat_task/widget/logo.dart';
import 'package:cat_task/widget/submit_button.dart';
import 'package:cat_task/widget/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserData _userData = UserData();
  String? emailId, passwordUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Logo(height: 4.5),
              const SizedBox(
                height: 50,
              ),
              const AppItem(),
              const SizedBox(
                height: 40,
              ),
              Text(
                'or',
                style: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              TextFieldItem(
                  onChange: (val) {
                    emailId = val;
                  },
                  hintText: 'Enter your email Id',
                  labelText: 'Email ID',
                  secure: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val.toString().isEmpty) {
                      return 'please enter your email Id';
                    }
                  }
                  ),
              const SizedBox(
                height: 20,
              ),
              TextFieldItem(
                onChange: (val) {
                  passwordUser = val;
                },
                hintText: 'Enter your password',
                labelText: 'Password',
                secure: true,
                keyboardType: TextInputType.visiblePassword,
                validator: (val) {
                  if (val.toString().isEmpty) {
                    return 'you must enter your password';
                  }
                },
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
              ),
              const SizedBox(
                height: 25,
              ),
              SubmitButton(
                text: 'Login',
                onTap: () {
                  print('Login');
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print('Login');
                    _userData.getData(
                        context: context,
                        emailUser: emailId!,
                        passwordUser: passwordUser!);
                  }
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                },
                child: const Text("Don't have an account ? Register now",
                    style: TextStyle(color: Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
