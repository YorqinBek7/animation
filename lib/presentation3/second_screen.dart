import 'package:flutter/material.dart';

class SecondScreenFrom3 extends StatefulWidget {
  const SecondScreenFrom3({super.key});

  @override
  State<SecondScreenFrom3> createState() => _SecondScreenFrom3State();
}

class _SecondScreenFrom3State extends State<SecondScreenFrom3>
    with TickerProviderStateMixin {
  double width = 0.0;
  late Animation animation;
  late AnimationController controller;
  late AnimationController controller2;
  late Animation percentAnimation;
  late Animation colorAnimation;
  bool isDone = false;
  bool isReset = false;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween(begin: 0.0, end: 350.0).animate(controller);
    percentAnimation = Tween(begin: 0.0, end: 100).animate(controller2);
    colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller2);
    controller.addListener(() {
      setState(() {});
    });
    controller2.addListener(() {
      setState(() {});
      if (controller2.isCompleted) {
        isDone = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Percent animate"),
      ),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorAnimation.value,
              ),
            ),
            Stack(children: [
              Container(
                height: 50,
                width: 350,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              AnimatedContainer(
                height: 50,
                width: animation.value,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                duration: const Duration(seconds: 1),
              ),
            ]),
            percentAnimation.value != 100
                ? Text(
                    "${(percentAnimation.value).toInt()} %",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : const Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            const SizedBox(height: 10),
            InkWell(
              onTap: (() {
                if (isDone == false) {
                  controller.forward();
                  controller2.forward();
                } else {
                  controller.reset();
                  controller2.reset();
                  Future.delayed(const Duration(seconds: 1), () {
                    controller.forward();
                    controller2.forward();
                  });
                }
              }),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Animate",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
