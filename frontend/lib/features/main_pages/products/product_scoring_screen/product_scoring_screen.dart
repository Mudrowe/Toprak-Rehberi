import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/product_details/widgets/sections/product_details_image.dart';
import 'package:toprak_rehberi/common/widgets/product_details/widgets/sections/product_details_planting_date.dart';
import 'package:toprak_rehberi/features/main_pages/products/product_scoring_screen/widgets/scoring_bar.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/helpers/score_display.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

import '../../../../dtos/ProductDTO.dart';

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

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const TAppBar(showBackButton: true),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(widget.productDTO.productName!, style: textTheme.headlineMedium),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Product image
              TProductDetailsImage(productDTO: widget.productDTO),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Planting Date
              TProductDetailsPlantingDate(
                  textTheme: textTheme, productDTO: widget.productDTO),

              const SizedBox(height: TSizes.spaceBtwItems),

              // ! There should be TLandDetailsInfo in here
              // ! So, products must have land variable
              // Field Info
              Container(
                height: 150,
                width: TSizes.cardWidth / 1.2,
                decoration: getCardDecoration(context),
                child: Column(
                  children: [
                    Text(widget.productDTO.landName),
                    Text(widget.productDTO.area.toString())
                  ],
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwItems),


              // Score Your Harvest
              const Text(TTexts.scoreProduct),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Selected Score
              TScoreDisplay(score: _selectedScore),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Scores Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Bad
                  TScoringBar(
                    onTap: () => _updateScore(1),
                    scoreColor: TColors.bad,
                    scorePath: TImages.bad,
                    scoreText: TTexts.bad,
                  ),

                  // Meh
                  TScoringBar(
                    onTap: () => _updateScore(2),
                    scoreColor: TColors.meh,
                    scorePath: TImages.meh,
                    scoreText: TTexts.meh,
                  ),

                  // Mid
                  TScoringBar(
                    onTap: () => _updateScore(3),
                    scoreColor: TColors.mid,
                    scorePath: TImages.mid,
                    scoreText: TTexts.mid,
                  ),

                  // Good
                  TScoringBar(
                    onTap: () => _updateScore(4),
                    scoreColor: TColors.good,
                    scorePath: TImages.good,
                    scoreText: TTexts.good,
                  ),

                  // Very Good
                  TScoringBar(
                    onTap: () => _updateScore(5),
                    scoreColor: TColors.veryGood,
                    scorePath: TImages.veryGood,
                    scoreText: TTexts.veryGood,
                  ),
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Confirm Button
              SizedBox(
                width: TSizes.buttonWidth,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(TTexts.submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
