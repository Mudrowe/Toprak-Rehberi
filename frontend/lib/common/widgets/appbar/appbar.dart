import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/utils/device/device_utility.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final String? title;
  const TAppBar({super.key, this.showBackButton = true, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back),
            )
          : null,
      title: title != null ? Text(title!) : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
