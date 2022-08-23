// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FirstScreenClass2 extends StatefulWidget {
  const FirstScreenClass2({super.key});

  @override
  State<FirstScreenClass2> createState() => _FirstScreenClass2State();
}

class _FirstScreenClass2State extends State<FirstScreenClass2>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation animationSize;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: Alignment.topLeft, end: Alignment.bottomRight)
        .animate(controller);
    animationSize = Tween(begin: 80.0, end: 200.0).animate(controller);
    controller.repeat(reverse: true);
    controller.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: animation.value,
              child: Container(
                width: animationSize.value,
                height: animationSize.value,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
