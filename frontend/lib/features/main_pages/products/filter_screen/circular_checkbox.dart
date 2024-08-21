import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';

class CircularCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  CircularCheckbox({required this.value, required this.onChanged});

  @override
  _CircularCheckboxState createState() => _CircularCheckboxState();
}

class _CircularCheckboxState extends State<CircularCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.value ? TColors.primaryColor : Colors.transparent,
          border: Border.all(color: TColors.primaryColor, width: 2.0),
        ),
        alignment: Alignment.center,
        child: widget.value
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 10,
              )
            : null,
      ),
    );
  }
}
