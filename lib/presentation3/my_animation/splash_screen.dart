import 'dart:math';

import 'package:animation/presentation3/my_animation/my_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreenNotes extends StatefulWidget {
  const SplashScreenNotes({super.key});

  @override
  State<SplashScreenNotes> createState() => _SplashScreenNotesState();
}

class _SplashScreenNotesState extends State<SplashScreenNotes>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller2;
  late Animation animation;
  late Animation textAnimation;
  late Animation widthAnimation;
  late Animation heightAnimation;
  late CurvedAnimation curvedAnimation;
  late Animation<double> rotate;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween(begin: 100.0, end: 200.0).animate(controller);
    widthAnimation = Tween(begin: 50.0, end: 110.0).animate(controller);
    heightAnimation = Tween(begin: 40.0, end: 90.0).animate(controller);
    curvedAnimation = CurvedAnimation(parent: controller2, curve: Curves.ease);
    rotate = Tween<double>(begin: 0.0, end: pi).animate(curvedAnimation);
    controller.forward();
    controller2.forward();
    controller2.addListener(() {
      setState(() {});
      if (controller2.isCompleted) {
        controller2.reset();
      }
    });
    controller.addListener(() {
      setState(() {});
    });
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyAnimation(),
          ));
      controller.dispose();
      controller2.dispose();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 245, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 245, 245),
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Color.fromARGB(255, 247, 245, 245),
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: animation.value,
                height: animation.value,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    shape: BoxShape.circle),
                child: Stack(
                  children: [
                    Positioned(
                      left: 5,
                      top: 0,
                      bottom: 0,
                      child: Image.asset(
                        "assets/images/pencil.png",
                        width: widthAnimation.value,
                        height: heightAnimation.value,
                      ),
                    ),
                    Positioned(
                      left: 50,
                      right: 0,
                      top: 60,
                      child: Image.asset(
                        "assets/images/note.png",
                        width: widthAnimation.value,
                        height: heightAnimation.value,
                      ),
                    ),
                  ],
                ),
              ),
              RotationTransition(
                turns: rotate,
                child: const Text(
                  "Notes",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
