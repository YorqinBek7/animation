import 'package:animation/presentation3/main_presentation.dart';
import 'package:animation/presentation3/my_animation/my_animation.dart';
import 'package:animation/presentation3/my_animation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Containers",
      debugShowCheckedModeBanner: false,
      home: MainPresentation(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;
  late Animation borderSizeAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    colorAnimation =
        ColorTween(begin: Colors.red, end: Colors.amber).animate(controller);
    sizeAnimation = Tween<double>(begin: 170.0, end: 200.0).animate(controller);
    borderSizeAnimation =
        Tween<double>(begin: 15.0, end: 20.0).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: Center(
        child: Container(
          height: sizeAnimation.value,
          width: sizeAnimation.value,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderSizeAnimation.value),
            color: colorAnimation.value,
          ),
        ),
      )),
    );
  }
}
