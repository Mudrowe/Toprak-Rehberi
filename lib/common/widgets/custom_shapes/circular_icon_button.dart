import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';

class CircularIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String assetImagePath;
  final Color backgroundColor;
  final Color iconColor;
  final double padding;

  const CircularIconButton({
    super.key,
    required this.onPressed,
    required this.assetImagePath,
    this.backgroundColor = TColors.primaryColor,
    this.iconColor = TColors.white,
    this.padding = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: padding, left: padding),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Center(
          child: IconButton(
            onPressed: onPressed,
            icon: ImageIcon(
              AssetImage(assetImagePath),
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
