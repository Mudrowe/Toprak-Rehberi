import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';

class TShadowStyle {
  static final productShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(0.1),
    blurRadius: 10,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}