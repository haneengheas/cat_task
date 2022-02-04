import 'package:cat_task/constant/styles.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Container(
          height: sizeFromHeight(context, 3),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/1.jpg'),
                  fit: BoxFit.fitHeight)),
        ),
      ),
    );
  }
}
