import 'package:animation/presentation/fiveth_animation.dart';
import 'package:flutter/material.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));

    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.linear);

    animation = Tween(begin: 0.0, end: 15.0).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fourth"),
        actions: [
          IconButton(
              onPressed: (() => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FivethScreen(),
                        ))
                  }),
              icon: const Icon(
                Icons.navigate_next,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        child: Center(
          child: Transform.rotate(
            angle: animation.value,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
