// ignore_for_file: file_names, unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nba/Providers/SplashProvider.dart';
import 'package:provider/provider.dart';


// starting of Splash Screen page.
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  // using animation controller for control fade in and fade out animations.
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2500),
  )..repeat(reverse: true);
  late final Animation<double> animation =
      CurvedAnimation(parent: controller, curve: Curves.easeIn);

  @override
  void initState() {
    super.initState();

    // defines splash provider and calling method to change images.
    final provider = Provider.of<SplashProvider>(context, listen: false);
    Timer.periodic(const Duration(milliseconds: 5000), (timer) {
      provider.changeImage();
    });
  }

  @override
  void dispose() {
    super.dispose();
    // dispose controller.
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff000000),
        // this widget is for fade in and fade out transitation.
        body: FadeTransition(
          opacity: animation,
          child: Consumer<SplashProvider>(
            builder: (context, value, child) {
              int index = value.index;
              List<String> images = value.images;
              return Center(
                child: Image.asset(
                  images[index],
                  height: 600.h,
                  width: 350.w,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
