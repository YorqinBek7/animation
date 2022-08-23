import 'dart:math';
import 'package:animation/presentation/second_animation.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;
  late Animation animation;

  late AnimationController controller2;
  late CurvedAnimation curvedAnimation2;
  late Animation animation2;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInBack,
      reverseCurve: Curves.easeIn,
    );

    animation = Tween(begin: 0.0, end: 2 * pi).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    controller.repeat();

    controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    curvedAnimation2 = CurvedAnimation(
      parent: controller2,
      curve: Curves.bounceIn,
      reverseCurve: Curves.ease,
    );
    animation2 = Tween(begin: 0.0, end: 2 * pi).animate(curvedAnimation2)
      ..addListener(() {
        setState(() {});
      });
    controller2.repeat(reverse: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First"),
        actions: [
          IconButton(
              onPressed: (() => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SecondSCreen(),
                        ))
                  }),
              icon: const Icon(
                Icons.navigate_next,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Transform.rotate(
              angle: animation.value,
              child: Container(
                width: 150,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Transform.rotate(
              angle: animation2.value,
              child: Container(
                width: 150,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
