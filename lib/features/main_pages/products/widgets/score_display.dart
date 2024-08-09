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

    switch (score) {
      case 1:
        imagePath = TImages.bad; 
        scoreText = 'Kötü';
        break;
      case 2:
        imagePath = TImages.meh;
        scoreText = 'Eh İşte';
        break;
      case 3:
        imagePath = TImages.mid;
        scoreText = 'Ortalama';
        break;
      case 4:
        imagePath = TImages.good;
        scoreText = 'İyi';
        break;
      case 5:
        imagePath = TImages.veryGood;
        scoreText = 'Çok İyi';
        break;
      default:
        imagePath = TImages.mid; 
        scoreText = 'Ortalama';
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
