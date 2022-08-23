import 'package:flutter/material.dart';

class BoxTranstion extends StatefulWidget {
  const BoxTranstion({super.key});

  @override
  State<BoxTranstion> createState() => _BoxTranstionState();
}

class _BoxTranstionState extends State<BoxTranstion>
    with TickerProviderStateMixin {
  bool isTap = false;
  late AnimationController controller;
  late Animation<Decoration> animation;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = DecorationTween(
      begin: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
        ),
      ),
      end: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
        border: Border.all(
          color: Colors.black,
        ),
      ),
    ).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    //////////////////////////////////
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DecoratedBoxTransition(
                decoration: animation,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const FlutterLogo(
                    size: 150,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    isTap = !isTap;
                    if (isTap) {
                      controller.forward();
                    } else {
                      controller.reverse();
                    }

                    setState(() {});
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  child: const Text(
                    "Click me",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
