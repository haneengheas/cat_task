import 'package:flutter/material.dart';

class TextFieldItem extends StatefulWidget {
  final String? hintText, labelText;
  final bool? secure;
  final TextInputType? keyboardType;
  final FormFieldValidator? validator;
  final Function (String)?onChange ;

  const TextFieldItem(
      {required this.labelText,
      required this.hintText,
      required this.secure,
      required this.keyboardType,
      required this.validator,
       this.onChange,
      Key? key})
      : super(key: key);

  @override
  _TextFieldItemState createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<TextFieldItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        validator: widget.validator,
        onChanged: widget.onChange,
        obscureText: widget.secure!,
        obscuringCharacter: '*',
        keyboardType: widget.keyboardType!,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 22),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
