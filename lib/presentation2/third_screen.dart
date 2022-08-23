import 'package:flutter/material.dart';

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  bool opacity = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedOpacity")),
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity == false ? 0 : 1,
          duration: const Duration(seconds: 1),
          child: Container(
            color: Colors.greenAccent,
            width: 250,
            height: 250,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(
            () => {
              opacity = !opacity,
            },
          )
        },
        child: const Icon(Icons.opacity_sharp),
      ),
    );
  }
}
