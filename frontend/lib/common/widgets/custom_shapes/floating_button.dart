import 'package:flutter/material.dart';

import '../../../features/main_pages/lands/add_land_screen/add_land_screen.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
    required this.dark,
    required this.label, required this.route,
  });

  final bool dark;
  final String label;
  final Widget route;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => route,
            ),
          ),
          foregroundColor: TColors.light,
          backgroundColor: dark ? TColors.dark : TColors.primaryColor,
          shape: const CircleBorder(side: BorderSide(color: TColors.light)),
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: TSizes.sm),
        Stack(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 3
                  ..color = TColors.dark,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: TColors.light,
              ),
            ),
          ],
        )
      ],
    );
  }
}
