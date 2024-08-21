import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class TProfileSectionButton extends StatelessWidget {
  const TProfileSectionButton({
    super.key,
    required this.text,
    required this.textColor,
    this.toWhere,
  });

  final String text;
  final Color textColor;
  final VoidCallback? toWhere;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toWhere,
      child: Container(
        width: TSizes.buttonWidth / 1.5,
        padding: const EdgeInsets.all(TSizes.md),
        decoration: getCardDecoration(context),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
