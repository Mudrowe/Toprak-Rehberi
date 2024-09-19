import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/features/main_pages/products/product_scoring_screen/update_score.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/helpers/score_display.dart';
import 'package:toprak_rehberi/features/main_pages/products/product_scoring_screen/widgets/scoring_bar.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';
import 'package:toprak_rehberi/dtos/ProductDTO.dart';

import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../product_details/product_details_common.dart';

class ProductScoringScreen extends StatefulWidget {
  final ProductDTO productDTO;

  const ProductScoringScreen({super.key, required this.productDTO});

  @override
  _ProductScoringScreenState createState() => _ProductScoringScreenState();
}

class _ProductScoringScreenState extends State<ProductScoringScreen> {
  double _selectedScore = 3;

  void _updateScore(double newScore) {
    setState(() {
      _selectedScore = newScore;
    });
  }

  void _submitScore() {
    widget.productDTO.score = _selectedScore;
    widget.productDTO.isHarvested = true;

    try {
      updateProductScore(widget.productDTO);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ürün başarıyla hasat edildi')),
      );


      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const NavigationMenu(
            initialIndex: 2,
          ),
        ),
            (Route<dynamic> route) => false,
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hasat edilemedi')),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackButton: true),
      body: SingleChildScrollView(
        child: Center(
          child: ProductDetailsCommon(
            productDTO: widget.productDTO,
            bottomWidget: Column(
              children: [
                const Text(TTexts.scoreProduct),
                const SizedBox(height: TSizes.spaceBtwItems),
                TScoreDisplay(score: _selectedScore),
                const SizedBox(height: TSizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Scoring Bars
                    TScoringBar(
                      onTap: () => _updateScore(1),
                      scoreColor: TColors.bad,
                      scorePath: TImages.bad,
                      scoreText: TTexts.bad,
                    ),
                    TScoringBar(
                      onTap: () => _updateScore(2),
                      scoreColor: TColors.meh,
                      scorePath: TImages.meh,
                      scoreText: TTexts.meh,
                    ),
                    TScoringBar(
                      onTap: () => _updateScore(3),
                      scoreColor: TColors.mid,
                      scorePath: TImages.mid,
                      scoreText: TTexts.mid,
                    ),
                    TScoringBar(
                      onTap: () => _updateScore(4),
                      scoreColor: TColors.good,
                      scorePath: TImages.good,
                      scoreText: TTexts.good,
                    ),
                    TScoringBar(
                      onTap: () => _updateScore(5),
                      scoreColor: TColors.veryGood,
                      scorePath: TImages.veryGood,
                      scoreText: TTexts.veryGood,
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                  width: TSizes.buttonWidth,
                  child: ElevatedButton(
                    onPressed: _submitScore,
                    child: const Text(TTexts.submit),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
