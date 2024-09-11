import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/common/widgets/product_details/widgets/sections/harvest_button.dart';
import 'package:toprak_rehberi/common/widgets/product_details/widgets/sections/product_details_image.dart';
import 'package:toprak_rehberi/common/widgets/product_details/widgets/sections/product_details_planting_date.dart';
import 'package:toprak_rehberi/features/main_pages/products/widgets/product_card/product_progress.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';
import 'package:toprak_rehberi/dtos/ProductDTO.dart';
import 'package:toprak_rehberi/dtos/LandDTO.dart';

import '../../../models/land.dart';
import '../../../service/fetching/pages/fetch_lands.dart';
import '../../styles/card_style.dart';
import '../land_details/widgets/sections/land_details_column.dart';
import '../land_details/widgets/sections/land_details_info.dart';

class TProductDetails extends StatefulWidget {
  final ProductDTO productDTO;

  const TProductDetails({super.key, required this.productDTO});

  @override
  _TProductDetailsState createState() => _TProductDetailsState();
}

class _TProductDetailsState extends State<TProductDetails> {
  late Future<LandDTO> _landFuture;

  @override
  void initState() {
    super.initState();
    if (widget.productDTO.landName != null) {
      _landFuture = fetchLandByName(widget.productDTO.landName!);
    }
  }

  Address _convertToAddress(LandDTO landDTO) {
    return Address(
      city: 'City Placeholder',
      district: 'District Placeholder',
      neighborhood: 'Neighborhood',
      parcelNo: landDTO.parcelNo,
      adaNo: landDTO.adaNo,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Product Name
              Text(
                THelperFunctions.decodeUtf8(widget.productDTO.productName!) ??
                    'Unknown',
                style: textTheme.headlineMedium,
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Product image
              TProductDetailsImage(productDTO: widget.productDTO),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Planting Date
              TProductDetailsPlantingDate(
                textTheme: textTheme,
                productDTO: widget.productDTO,
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Land Info
              FutureBuilder<LandDTO>(
                future: _landFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final land = snapshot.data!;
                    return Container(
                      width: TSizes.cardWidth / 1.2,
                      decoration: getCardDecoration(context),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          TSizes.xxl,
                          TSizes.md,
                          TSizes.xxl,
                          TSizes.md,
                        ),
                        child: TLandDetailsColumn(
                          land: convertLandDTOToLand(
                            land,
                            _convertToAddress(land),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Text('Land details not available');
                  }
                },
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              // Progress Bar
              TProductProgress(productDTO: widget.productDTO),

              const SizedBox(height: TSizes.spaceBtwItems),

              THarvestButton(productDTO: widget.productDTO),
            ],
          ),
        ),
      ),
    );
  }
}
