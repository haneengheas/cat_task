import 'package:cat_task/constant/styles.dart';
import 'package:flutter/material.dart';
class Logo extends StatelessWidget {
  final double ? height;
  const Logo({required this.height ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeFromHeight(context,height!),
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage('assets/1.jpg'),
              fit: BoxFit.fitHeight)),
    );
  }
}
