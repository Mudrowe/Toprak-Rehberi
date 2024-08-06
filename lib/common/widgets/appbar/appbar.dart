import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/widgets/circular_icon_button.dart';
import 'package:toprak_rehberi/utils/constants/image_strings.dart';
import 'package:toprak_rehberi/utils/device/device_utility.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CircularIconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        assetImagePath: TImages.backArrow,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
