import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/products/filter_screen/date_picker.dart';
import 'package:toprak_rehberi/utils/constants/enums.dart';
import 'package:toprak_rehberi/utils/constants/text_strings.dart';

class TRadioListTile extends StatefulWidget {
  const TRadioListTile({super.key});

  @override
  State<TRadioListTile> createState() => _TRadioListTileState();
}

class _TRadioListTileState extends State<TRadioListTile> {
  Times? _character = Times.last30days;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RadioListTile<Times>(
          title: const Text('Son 30 gün'),
          value: Times.last30days,
          groupValue: _character,
          onChanged: (Times? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<Times>(
          title: const Text('Son 3 ay'),
          value: Times.last3months,
          groupValue: _character,
          onChanged: (Times? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<Times>(
          title: const Text('2024'),
          value: Times.thisYear,
          groupValue: _character,
          onChanged: (Times? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<Times>(
          title: const Text('2023'),
          value: Times.lastYear,
          groupValue: _character,
          onChanged: (Times? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<Times>(
          title: const Text('Özel Filtre'),
          value: Times.specialFilter,
          groupValue: _character,
          onChanged: (Times? value) {
            setState(() {
              _character = value;
            });
            if (value == Times.specialFilter) {
              selectDateRange(
                context: context,
                info: 'Select a custom date range',
              );
            }
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Cancel Button
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(TTexts.cancel),
            ),

            // Confirm Button
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(TTexts.submit),
            ),
          ],
        ),
      ],
    );
  }
}
