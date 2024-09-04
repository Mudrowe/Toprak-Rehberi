import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';
import 'package:toprak_rehberi/features/main_pages/lands/add_land_screen/widgets/add_land_form.dart';
import 'package:toprak_rehberi/service/land/add_land.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

import '../../../../models/land/land.dart';

class TAddLandScreen extends StatelessWidget {
  const TAddLandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaulSpace),
          child: Column(
            children: [
              // Form
              TAddLandForm(),
            ],
          ),
        ),
      ),
    );
  }
}
