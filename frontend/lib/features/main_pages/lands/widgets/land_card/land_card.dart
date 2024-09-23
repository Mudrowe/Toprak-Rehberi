import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/styles/card_style.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';
import 'package:toprak_rehberi/features/main_pages/lands/widgets/land_card/land_banner.dart';
import 'package:toprak_rehberi/features/main_pages/lands/widgets/land_card/land_card_info.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

import '../../land_details/land_details.dart';

class TLandCard extends StatefulWidget {
  const TLandCard({
    super.key,
    required this.landDTO,
    this.showBackground = true,
    this.showBorder = true,
  });

  final LandDTO landDTO;
  final bool showBackground, showBorder;

  @override
  _TLandCardState createState() => _TLandCardState();
}

class _TLandCardState extends State<TLandCard> {
  late Future<void> _cityDistrictFuture;

  @override
  void initState() {
    super.initState();
    _cityDistrictFuture = widget.landDTO.initializeCityAndDistrict();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _cityDistrictFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const _waitingBuilder();
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Error loading data'));
        }

        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TLandDetails(landDTO: widget.landDTO),
            ),
          ),
          child: Container(
            height: TSizes.cardHeight,
            width: TSizes.cardWidth,
            decoration: getCardDecoration(context),
            child: Column(
              children: [
                TLandBanner(landDTO: widget.landDTO),
                const SizedBox(height: TSizes.spaceBtwItems),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        THelperFunctions.decodeUtf8(
                            widget.landDTO.landTypeDTO.imageUrl),
                        height: TSizes.typeImageHeight,
                        width: TSizes.typeImageWidth,
                        fit: BoxFit.contain,
                      ),
                      TLandCardInfo(landDTO: widget.landDTO),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _waitingBuilder extends StatelessWidget {
  const _waitingBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TSizes.cardHeight,
      width: TSizes.cardWidth,
      decoration: getCardDecoration(context),
      child: const Padding(
        padding: EdgeInsets.only(top: 55, left: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skeleton(height: 120, width: 120),
            SizedBox(width: TSizes.slg),
            Expanded(
              child: Column(
                children: [
                  Skeleton(width: 80),
                  SizedBox(height: TSizes.sm),
                  Skeleton(),
                  SizedBox(height: TSizes.sm),
                  Skeleton(),
                  SizedBox(height: TSizes.sm),
                  Row(
                    children: [
                      Expanded(
                        child: Skeleton(),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Skeleton(),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    this.height,
    this.width,
  });

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}
