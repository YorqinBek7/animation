import 'package:flutter/material.dart';

class Sixth extends StatefulWidget {
  const Sixth({super.key});

  @override
  State<Sixth> createState() => _SixthState();
}

class _SixthState extends State<Sixth> {
  bool isBigger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bigger Font")),
      body: Center(
        child: Column(
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(seconds: 1),
              style:
                  TextStyle(color: Colors.black, fontSize: isBigger ? 65 : 24),
              child: const Text(
                  """Widget build(BuildContext context){return Scaffold(body: Container(child:Center(
      """),
            ),
            Container(
              color: Colors.grey.shade400,
              width: double.infinity,
              child: TextButton(
                  onPressed: (() => {
                        setState(
                          () => {
                            isBigger = !isBigger,
                          },
                        )
                      }),
                  child: const Text(
                    "Bigger Font",
                    style: TextStyle(color: Colors.black),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
