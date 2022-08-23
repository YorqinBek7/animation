import 'package:animation/presentation/fourth_animation.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third"),
        actions: [
          IconButton(
              onPressed: (() => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FourthScreen(),
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
          child: _animationContainer(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () => {
          counter++,
          setState(() => {}),
          if (counter == 5)
            {
              counter = 0,
            },
        },
      ),
    );
  }

  AnimatedContainer _animationContainer() {
    return AnimatedContainer(
      height: counter == 0
          ? 120
          : counter == 1
              ? 190
              : counter == 2
                  ? 130
                  : counter == 3
                      ? 150
                      : counter == 4
                          ? 70
                          : 100,
      width: counter == 0
          ? 120
          : counter == 1
              ? 70
              : counter == 2
                  ? 60
                  : counter == 3
                      ? 150
                      : counter == 4
                          ? 120
                          : 50,
      decoration: BoxDecoration(
          color: counter == 0
              ? Colors.red
              : counter == 1
                  ? Colors.amber
                  : counter == 2
                      ? Colors.green
                      : counter == 3
                          ? Colors.cyan
                          : counter == 4
                              ? Colors.orange
                              : Colors.pink,
          borderRadius: BorderRadius.circular(counter == 0
              ? 10
              : counter == 1
                  ? 15
                  : counter == 3
                      ? 10
                      : counter == 4
                          ? 15
                          : 5)),
      duration: const Duration(milliseconds: 500),
    );
  }
}
