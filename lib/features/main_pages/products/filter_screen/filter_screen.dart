import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/products/filter_screen/radio_list.dart';
Future<void> filter({
  required BuildContext context,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        title: Text('Zaman Filtresi'),
        content: TRadioListTile()
      );
    },
  );
}
