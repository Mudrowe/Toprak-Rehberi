import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toprak_rehberi/features/authentication/screens/signup/signup.dart';
import 'package:toprak_rehberi/utils/constants/colors.dart';
import 'package:toprak_rehberi/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: TColors.primaryColor,
          indicatorColor: TColors.white,          

          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Anasayfa'),
            NavigationDestination(icon: Icon(Icons.grass), label: 'Arazilerim'),
            NavigationDestination(
                icon: Icon(Icons.agriculture), label: 'Ürünlerim'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const SignupScreen(),
    Container(color: Colors.deepPurple),
    Container(color: Colors.amber),
    Container(color: Colors.red),
  ];
}
