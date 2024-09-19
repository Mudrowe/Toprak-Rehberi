import 'package:flutter/material.dart';
import 'package:toprak_rehberi/features/main_pages/home/home.dart';
import 'package:toprak_rehberi/features/main_pages/lands/lands.dart';
import 'package:toprak_rehberi/features/main_pages/products/products.dart';
import 'package:toprak_rehberi/features/main_pages/profile/profile.dart';
import 'package:toprak_rehberi/utils/constants/sizes.dart';

class NavigationMenu extends StatefulWidget {
  final int initialIndex;

  const NavigationMenu({super.key, this.initialIndex = 0});

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  late int _selectedIndex;

  final List<Widget> _screens = const [
    HomeScreen(),
    LandsScreen(),
    ProductsScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: TSizes.navigationBarHeight,
        elevation: 0,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Anasayfa'),
          NavigationDestination(icon: Icon(Icons.grass), label: 'Arazilerim'),
          NavigationDestination(icon: Icon(Icons.agriculture), label: 'Ürünlerim'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }
}
