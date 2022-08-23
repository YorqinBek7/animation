import 'package:flutter/material.dart';

class Eigthth extends StatefulWidget {
  const Eigthth({super.key});

  @override
  State<Eigthth> createState() => _EigththState();
}

class _EigththState extends State<Eigthth> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<AlignmentGeometry> animation;
  late Animation<AlignmentGeometry> animation2;
  bool isTap = false;
  bool isVisible = true;
  bool isVisible2 = true;
  // @override
  // void initState() {
  //   controller =
  //       AnimationController(vsync: this, duration: const Duration(seconds: 10));
  //   animation = Tween(begin: Alignment.topLeft, end: Alignment.bottomRight)
  //       .animate(controller);
  //   animation2 = Tween(begin: Alignment.bottomRight, end: Alignment.topLeft)
  //       .animate(controller);
  //   controller.forward();
  //   controller.addListener(() {
  //     setState(() {});
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TransForm two boxes")),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(seconds: 1),
              alignment: isTap ? Alignment.topLeft : Alignment.bottomRight,
              child: Visibility(
                visible: isVisible2,
                child: InkWell(
                  onTap: () => {
                    setState(() => {}),
                    isTap = !isTap,
                    isVisible = !isVisible,
                    // isVisible2 = !isVisible2,
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    color: Colors.blue,
                    width: isTap ? 150 : 100,
                    height: isTap ? 150 : 100,
                  ),
                ),
              ),
            ),
            AnimatedAlign(
              duration: const Duration(seconds: 1),
              alignment: isTap ? Alignment.bottomRight : Alignment.topLeft,
              child: Visibility(
                visible: isVisible,
                child: InkWell(
                  onTap: () => {
                    setState(() => {}),
                    isTap = !isTap,
                    //  isVisible = !isVisible,
                    isVisible2 = !isVisible2,
                  },
                  child: AnimatedContainer(
                    color: Colors.blue,
                    duration: const Duration(seconds: 1),
                    
                    width: isTap ? 100 : 150,
                    height: isTap ? 100 : 150,
            
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
