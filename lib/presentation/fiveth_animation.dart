import 'package:animation/presentation/sixth_animation.dart';
import 'package:flutter/material.dart';

class FivethScreen extends StatefulWidget {
  const FivethScreen({super.key});

  @override
  State<FivethScreen> createState() => _FivethScreenState();
}

class _FivethScreenState extends State<FivethScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation borderRadiusSizeAnimation;
  late Animation borderLineSizeAnimation;
  late Animation colorAnimation;
  late Animation borderLineColorAnimation;
  // late Animation borderRadiusSizeAnimation2;
  // late Animation borderLineSizeAnimation2;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    borderLineSizeAnimation = Tween(begin: 2.0, end: 20.0).animate(controller);
    borderLineColorAnimation =
        ColorTween(begin: Colors.black, end: Colors.red).animate(controller);
    borderRadiusSizeAnimation =
        Tween(begin: 10.0, end: 100).animate(controller);
    colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fiveth"),
        actions: [
          IconButton(
              onPressed: (() => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SixthScreen(),
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
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(borderRadiusSizeAnimation.value),
              border: Border.all(
                  width: borderLineSizeAnimation.value,
                  color: borderLineColorAnimation.value),
              color: colorAnimation.value,
            ),
          ),
        ),
      ),
    );
  }
}
