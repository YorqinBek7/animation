import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with SingleTickerProviderStateMixin {
  double padValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedPadding")),
      body: Center(
        child: InkWell(
          onTap: () => {
            setState(
              () => {padValue = padValue == 0 ? 150 : 0},
            )
          },
          child: AnimatedPadding(
            duration: const Duration(seconds: 2),
            padding: EdgeInsets.symmetric(horizontal: padValue),
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
