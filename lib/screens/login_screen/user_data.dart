// ignore_for_file: avoid_print

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cat_task/screens/home_screen/view.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  String? name, password,confirmPass , email, keunum;
  PhoneNumber? phoneNum;
  UserData({
    this.email,
    this.name,
    this.phoneNum,
    this.password,
    this.keunum,
    this.confirmPass,
  });
  saveData(
      {required String name,
      required String password,
      required String email,
      required String phone}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('name', name);
    preferences.setString('password', password);
    preferences.setString('email', email);
    preferences.setString('phone', phone);
    print('success');
  }

  getData({required String emailUser, required String passwordUser, required BuildContext context}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('email')!;
    password = preferences.getString('password')!;
    if (email == emailUser && password == passwordUser) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
    else if(email!= emailUser){
      AwesomeDialog(
          context: context,
          title: "Warning",
          dialogType: DialogType.ERROR,
          body: const Text("invalid email"))
          .show();
      print('faillllllllllll');
    }
    else if(password!= passwordUser){
      AwesomeDialog(
          context: context,
          title: "Warning",
          dialogType: DialogType.ERROR,
          body: const Text("invalid password"))
          .show();
      print('faillllllllllll');
    }
    print('suceesss');
  }
}
