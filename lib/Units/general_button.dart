
import 'package:flutter/material.dart';

class ClickButton extends StatelessWidget
{
  final Color buttonColor ;
  final double height ;
  final String labe;
  VoidCallback? onChange;

   ClickButton({super.key, required this.buttonColor, required this.height, required this.labe,  this.onChange});
  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: onChange,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: buttonColor,),
        height: height,
        child:   Center(
          child: Text(
            labe,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );

  }
}