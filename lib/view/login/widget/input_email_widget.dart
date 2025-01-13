import 'package:flutter/material.dart';

class InputEmailWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
 final FocusNode focusNode;

  const InputEmailWidget({super.key, required this.label, required this.controller,required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      focusNode: focusNode,
      decoration:  InputDecoration(hintText: "Please Enter The Email",
          border: InputBorder.none,
          label:  Text(label),fillColor: Colors.grey[200],filled: true),
    );
  }
}
