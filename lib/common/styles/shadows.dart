import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';

class TShadowStyle {
  static final productShadow = BoxShadow(
    color: TColors.black.withOpacity(0.4),
    blurRadius: 6,
    spreadRadius: 0,
    offset: const Offset(0, 2),
  );
}