import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class CustomOutlinedButton extends StatelessWidget {
    final VoidCallback onPressed;
    final String text;
    final Color borderColor;
    final Color textColor;
    final double width;
    final double height;
  
  const CustomOutlinedButton({super.key, 
    required this.onPressed,
    required this.text,
    required this.borderColor,
    required this.textColor,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(width, height),
        backgroundColor: Colors.white,
        side: BorderSide(color: borderColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
        )
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor,),
      ),
    );
  }
}