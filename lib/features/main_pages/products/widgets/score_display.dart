import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';


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
    Color scoreColor;

    switch (score) {
      case 1:
        imagePath = TImages.bad; 
        scoreText = 'Kötü';
        scoreColor = TColors.bad;
        break;
      case 2:
        imagePath = TImages.meh;
        scoreText = 'Eh İşte';
        scoreColor = TColors.meh;
        break;
      case 3:
        imagePath = TImages.mid;
        scoreText = 'Ortalama';
        scoreColor = TColors.mid;
        break;
      case 4:
        imagePath = TImages.good;
        scoreText = 'İyi';
        scoreColor = TColors.good;
        break;
      case 5:
        imagePath = TImages.veryGood;
        scoreText = 'Çok İyi';
        scoreColor = TColors.veryGood;
        break;
      default:
        imagePath = TImages.mid; 
        scoreText = 'Ortalama';
        scoreColor = TColors.mid;
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
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: scoreColor, 
            fontSize: 22
          ),
        ),
      ],
    );
  }
}
