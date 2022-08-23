// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<AlignmentGeometry> animationAlign;
  late Animation<double> rotateAnimation;
  late Animation<double> animation;
  double begin = 30.0;
  double end = 50.0;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    rotateAnimation =
        Tween<double>(begin: 0.0, end: 2 * pi).animate(controller);
    // animationAlign = Tween<AlignmentGeometry>(
    //         begin: Alignment.bottomLeft, end: Alignment.topRight)
    //     .animate(controller);

    controller.forward();
    animation = Tween(begin: begin, end: end).animate(controller);
    controller.addListener(() {
      if (controller.isCompleted) {
        begin = 50.0;
        end = 30.0;
        controller.forward();

        controller.addListener(() {
          setState(() {});
        });
      }
      setState(() {});
    });
    super.initState();
  }

  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Stack(children: [
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 50),
                    child: isOn
                        ? Icon(
                            Icons.favorite_outlined,
                            size: animation.value,
                          )
                        : Icon(
                            Icons.favorite_outlined,
                            size: 40,
                          )),
              ),
            ),
            Positioned(
                right: 10,
                bottom: 15,
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Text(
                    "2",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ]),
        ],
      ),
      body: Container(
        child: Center(
          //     child: RotationTransition(
          //   turns: rotateAnimation,
          //   child: controller.isCompleted
          //       ? Container(
          //           child: FlutterLogo(
          //             size: 200,
          //           ),
          //         )
          //       : Container(
          //           child: FlutterLogo(
          //             size: animation.value,
          //           ),
          //         ),
          // )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   color: Colors.red,
              //   width: 300,
              //   height: 300,
              //   child: AnimatedAlign(
              //     alignment: animationAlign.value,
              //     duration: Duration(seconds: 1),
              //     child: AnimatedRotation(
              //       turns: rotateAnimation.value,
              //       duration: Duration(seconds: 1),
              //       child: Container(
              //         padding: EdgeInsets.all(10),
              //         decoration: BoxDecoration(
              //           color: Colors.grey,
              //           borderRadius: BorderRadius.circular(2),
              //         ),
              //         child: Icon(
              //           Icons.add,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              InkWell(
                  onTap: () => {
                        setState(
                          () => {
                            isOn = !isOn,
                          },
                        )
                      },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text("Press"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
