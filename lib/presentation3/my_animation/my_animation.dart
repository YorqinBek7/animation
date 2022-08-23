import 'package:animation/presentation3/my_animation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class MyAnimation extends StatefulWidget {
  const MyAnimation({super.key});

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller2;
  late AnimationController controller3;
  late AnimationController controller4;
  late AnimationController controller5;
  late Animation<AlignmentGeometry> animation;
  late Animation<AlignmentGeometry> animation2;
  late Animation<AlignmentGeometry> animation3;
  late Animation<AlignmentGeometry> animation4;
  late Animation<AlignmentGeometry> animation5;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller3 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller4 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller5 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<AlignmentGeometry>(
            begin: Alignment.bottomCenter, end: Alignment.topCenter)
        .animate(controller);
    animation2 = Tween<AlignmentGeometry>(
            begin: Alignment.bottomCenter, end: Alignment.topCenter)
        .animate(controller2);
    animation3 = Tween<AlignmentGeometry>(
            begin: Alignment.bottomCenter, end: Alignment.topCenter)
        .animate(controller3);
    animation4 = Tween<AlignmentGeometry>(
            begin: Alignment.bottomCenter, end: Alignment.topCenter)
        .animate(controller4);
    _init();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
      controller.dispose();
      controller2.dispose();
      controller3.dispose();
      controller4.dispose();
      controller5.dispose();
    });

    super.initState();
  }

  _init() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500), () {});
      controller.reset();
      controller2.forward();

      await Future.delayed(const Duration(milliseconds: 500), () {});
      controller2.reset();
      controller3.forward();

      await Future.delayed(const Duration(milliseconds: 500), () {});
      controller3.reset();
      controller4.forward();

      await Future.delayed(const Duration(milliseconds: 500), () {});
      controller4.reset();
      controller.forward();
    }
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
            statusBarIconBrightness: Brightness.dark),
      ),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
                width: 20,
                child: AlignTransition(
                  alignment: animation2,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
                width: 20,
                child: AlignTransition(
                  alignment: animation3,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
                width: 20,
                child: AlignTransition(
                  alignment: animation4,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
                width: 20,
                child: AlignTransition(
                  alignment: animation,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
