import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/home/widgets/product_card_home.dart';

class TCardSlider extends StatelessWidget {
  const TCardSlider({
    super.key,
    required this.cards,
  });

  final List<TProductCardHome> cards;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1,
        aspectRatio: 3,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 10),
        autoPlayAnimationDuration: const Duration(seconds: 2),
      ),
      items: cards.map((card) {
        return card;
      }).toList(),
    );
  }
}
