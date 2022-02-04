import 'package:cat_task/constant/styles.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String? text;
   final Function? onTap;
  const  SubmitButton({required this.text,required this.onTap, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTap!(),
      child: Container(
        width: sizeFromWidth(context, 1),
        height: 50,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 12.5),
        decoration: BoxDecoration(
          color: const Color(0xfffbb039),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text!,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
