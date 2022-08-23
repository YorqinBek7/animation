import 'package:flutter/material.dart';

class Fourth extends StatefulWidget {
  const Fourth({super.key});

  @override
  State<Fourth> createState() => _FourthState();
}

class _FourthState extends State<Fourth> with SingleTickerProviderStateMixin {
  late Animation<AlignmentGeometry> animation;
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;
  late Animation _rotateAnimation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    curvedAnimation = CurvedAnimation(
      curve: Curves.bounceIn,
      parent: controller,
    );
    _rotateAnimation = Tween(begin: 0, end: 4).animate(curvedAnimation);
    animation = Tween(begin: Alignment.topLeft, end: Alignment.bottomRight)
        .animate(curvedAnimation);
    controller.repeat();
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transition"),
      ),
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          color: Colors.grey,
          child: AlignTransition(
            alignment: animation,
            child: Container(
              color: Colors.green,
              child: const Text(
                "YorqinBek Yuldashev",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
