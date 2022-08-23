import 'dart:math';

import 'package:flutter/material.dart';

class SixthScreen extends StatefulWidget {
  const SixthScreen({super.key});

  @override
  State<SixthScreen> createState() => _SixthScreenState();
}

class _SixthScreenState extends State<SixthScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;
  late Animation animation;
  late AnimationController controller2;
  late CurvedAnimation curvedAnimation2;
  late Animation animation2;

  @override
  void initState() {
////////////////////////////////////////////////////////////////////////////////////////////////
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    curvedAnimation = CurvedAnimation(
      curve: Curves.linear,
      parent: controller,
      reverseCurve: Curves.linear,
    );
    animation = Tween(begin: 0.0, end: 2 * pi).animate(curvedAnimation);
    controller.repeat();
    controller.addListener(() {
      setState(() {});
    });
//////////////////////////////////////////////////////////////////////////////////////////////
    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    curvedAnimation2 = CurvedAnimation(
      curve: Curves.linear,
      reverseCurve: Curves.linear,
      parent: controller2,
    );
    animation2 = Tween(begin: 2 * pi, end: 0).animate(curvedAnimation2);
    controller2.repeat();
    controller2.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sixth"),
      ),
      body: Container(
          child: Center(
        child: Stack(
          children: [
            Transform.rotate(
              angle: animation.value,
              child: Container(
                color: Colors.red,
                width: 200,
                height: 200,
              ),
            ),
            Transform.rotate(
              angle: animation2.value,
              child: Container(
                color: Colors.yellow,
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
