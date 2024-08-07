import 'package:flutter/material.dart';
import 'package:toprak_rehberi/common/widgets/appbar/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      //backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(height: 1500, width: 420, color: Colors.blue),
            Positioned(
              top: 300,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),

                height: 1500,
                width: 414,
                //color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
