import 'package:flutter/material.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/device/device_utility.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      child: Container(
        color: dark ? TColors.black : TColors.white,
        child: TabBar(
          tabs: tabs,
          isScrollable: false,
          indicatorColor: dark ? TColors.white : TColors.primaryColor,
          labelColor: dark ? TColors.white : TColors.primaryColor,
          unselectedLabelColor: TColors.darkGrey,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
