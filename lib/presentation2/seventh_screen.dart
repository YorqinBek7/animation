import 'package:flutter/material.dart';

class Seventh extends StatefulWidget {
  const Seventh({super.key});

  @override
  State<Seventh> createState() => _SeventhState();
}

class _SeventhState extends State<Seventh> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation colorAnimation;
  late Animation colorBorderAnimation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween(begin: 15.0, end: 40).animate(controller);
    colorAnimation = ColorTween(begin: Colors.yellow, end: Colors.purple)
        .animate(controller);
    colorBorderAnimation =
        ColorTween(begin: Colors.orange, end: Colors.orange.shade900)
            .animate(controller);
    controller.repeat(reverse: true);
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Circle Radius")),
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: colorBorderAnimation.value, width: animation.value),
              color: colorAnimation.value,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 5,
                  blurRadius: 20,
                  offset: Offset(10, 5),
                )
              ]),
        ),
      ),
    );
  }
}
