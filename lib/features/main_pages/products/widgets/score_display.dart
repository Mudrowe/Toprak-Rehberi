import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';


// ? Resolution of images is not very good.
// ? Mid color is not very visible for reading

class TScoreDisplay extends StatelessWidget {
  const TScoreDisplay({
    super.key,
    required this.score,
  });

  final int score; 

  @override
  Widget build(BuildContext context) {
    String imagePath;
    String scoreText;

    switch (score) {
      case 1:
        imagePath = TImages.bad; 
        scoreText = TTexts.bad;
        break;
      case 2:
        imagePath = TImages.meh;
        scoreText = TTexts.meh;
        break;
      case 3:
        imagePath = TImages.mid;
        scoreText = TTexts.mid;
        break;
      case 4:
        imagePath = TImages.good;
        scoreText = TTexts.good;
        break;
      case 5:
        imagePath = TImages.veryGood;
        scoreText = TTexts.veryGood;
        break;
      default:
        imagePath = TImages.mid; 
        scoreText = TTexts.mid;
    }

    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 55, 
          height: 55,
          fit: BoxFit.contain
        ),
        Text(
          scoreText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: TColors.black
          ),
        ),
      ],
    );
  }
}
