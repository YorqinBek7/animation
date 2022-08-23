import 'package:animation/presentation/third_animation.dart';
import 'package:flutter/material.dart';

class SecondSCreen extends StatefulWidget {
  const SecondSCreen({super.key});

  @override
  State<SecondSCreen> createState() => _SecondSCreenState();
}

class _SecondSCreenState extends State<SecondSCreen> {
  double top = 0.0;
  double bottom = 0.0;
  double right = 0.0;
  double left = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second"),
        actions: [
          IconButton(
              onPressed: (() => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ThirdScreen(),
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
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Stack(children: [
                      AnimatedPositioned(
                        width: 80,
                        height: 80,
                        top: top,
                        left: left,
                        duration: const Duration(seconds: 0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ]),
                  ),
                ),
                Expanded(
                  child: _buttons(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buttons() {
    return Column(
      children: [
        InkWell(
          onTap: () => {
            setState(
              () => {
                top -= 10,
              },
            )
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            color: Colors.grey,
            width: 70,
            height: 50,
            child: const Center(
              child: Text("Top"),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => {
                setState(
                  () => {
                    left -= 10,
                  },
                )
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                color: Colors.grey,
                width: 70,
                height: 50,
                child: const Center(
                  child: Text("Left"),
                ),
              ),
            ),
            const SizedBox(
              width: 70,
            ),
            InkWell(
              onTap: () => {
                setState(
                  () => {
                    left += 10,
                  },
                )
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                color: Colors.grey,
                width: 70,
                height: 50,
                child: const Center(
                  child: Text("Right"),
                ),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () => {
            setState(
              () => {
                top += 10,
              },
            )
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            color: Colors.grey,
            width: 70,
            height: 50,
            child: const Center(
              child: Text("Bottom"),
            ),
          ),
        )
      ],
    );
  }
}
