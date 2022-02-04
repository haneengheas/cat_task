// ignore_for_file: avoid_print
import 'dart:ui';
import 'package:cat_task/constant/styles.dart';
import 'package:cat_task/screens/home_screen/view.dart';
import 'package:cat_task/screens/login_screen/user_data.dart';
import 'package:cat_task/widget/submit_button.dart';
import 'package:cat_task/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserData _userData = UserData();
  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.black,
              size: 20,
            )),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  'Register to Music Festival',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldItem(
                  onChange: (val) {
                    _userData.name = val;
                  },
                  hintText: 'Enter your name',
                  labelText: 'Full Name',
                  secure: false,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'please enter your name';
                    } else if (value.length <= 2) {
                      return 'name should at least 3 char';
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              TextFieldItem(
                onChange: (val) {
                  _userData.email = val;
                },
                hintText: 'Enter your email',
                labelText: 'Email',
                secure: false,
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'please enter your email';
                  } else if (!val.toString().contains('@')) {
                    return 'email should contain @';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: sizeFromWidth(context, 1),
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mobile Number',
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 15),
                    ),
                    InternationalPhoneNumberInput(
                      hintText: 'Phone ',

                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'please enter your mobile';
                        }
                        if (val.length <= 5) {
                          return 'mobile should be at least 5 num';
                        }
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                        showFlags: false,
                      ),
                      keyboardType: TextInputType.phone,
                      onInputChanged: (PhoneNumber phone) {
                        _userData.phoneNum = phone;
                        _userData.keunum= phone.isoCode!;
                        print(_userData.phoneNum);
                      },
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      formatInput: true,
                    ),
                  ],
                ),
              ),
              TextFieldItem(
                onChange: (val) {
                  _userData.password = val;
                },
                hintText: 'Enter your password',
                labelText: 'Password',
                secure: true,
                keyboardType: TextInputType.visiblePassword,
                validator: (val) {
                  if (val.toString().isEmpty) {
                    return 'please enter your password';
                  } else if (!validateStructure(val)) {
                    return 'password should contain 8 digit \n at least one num capital small char and @#%&';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldItem(
                onChange: (val) {
                  _userData.confirmPass = val;
                },
                hintText: 'Enter your password',
                labelText: 'Confirm Password',
                secure: true,
                keyboardType: TextInputType.visiblePassword,
                validator: (val) {
                  if (val.toString().isEmpty) {
                    return 'please enter your password';
                  } else if (!validateStructure(val)) {
                    return 'password should contain 8 digit \n at least one num capital small char and @#%&';
                  }
                  else if (_userData.password != _userData.confirmPass) {
                    return 'Password does not match';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SubmitButton(
                  text: 'Register',
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      await _userData.saveData(
                          name: _userData.name!,
                          password: _userData.password!,
                          email: _userData.email!,
                          phone: _userData.phoneNum!.toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  children: const [
                    Text(
                      'By Registering you agree to Term & Conditions ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' and privacy Policy of the festival',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
