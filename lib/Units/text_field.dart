

import 'package:flutter/material.dart';

class GeneralTextField extends StatelessWidget
{
  Function(String)? onChange;
  final String hintText;
  final Color boarderColor;
  final Color textColor;
   GeneralTextField({super.key, required this.hintText, required this.boarderColor, required this.textColor,  this.onChange});
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: (data){
        if (data!.isEmpty) return 'Empty value';
      },
      onChanged: onChange,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        hintStyle: TextStyle(color : textColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:boarderColor),
        ),
      ),
    );
  }
}