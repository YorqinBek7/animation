import 'package:animation/presentation2/eighth_screen.dart';
import 'package:animation/presentation2/fifth_screen.dart';
import 'package:animation/presentation2/first_screen.dart';
import 'package:animation/presentation2/fourth_screen.dart';
import 'package:animation/presentation2/second_screen.dart';
import 'package:animation/presentation2/seventh_screen.dart';
import 'package:animation/presentation2/sixth_screen.dart';
import 'package:animation/presentation2/third_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Screens"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: ListTile(
              title: const Text("First Screen"),
              subtitle: const Text("AnimatedPadding"),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Screen1(),
                  ),
                )
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: ListTile(
              title: const Text("Second Screen"),
              subtitle: const Text("AnimatedDefaultTextStyle"),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Second(),
                  ),
                )
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: ListTile(
              title: const Text("Third Screen"),
              subtitle: const Text("AnimatedOpacity"),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Third(),
                  ),
                )
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: ListTile(
              title: const Text("Fourth Screen"),
              subtitle: const Text("Transition"),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Fourth(),
                  ),
                )
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: ListTile(
              title: const Text("Fifth Screen"),
              subtitle: const Text("AnimatedSize"),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Fifth(),
                  ),
                )
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: ListTile(
              title: const Text("Sixth Screen"),
              subtitle: const Text("Bigger font"),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Sixth(),
                  ),
                )
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: ListTile(
              title: const Text("Seventh Screen"),
              subtitle: const Text("Circle Radius"),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Seventh(),
                  ),
                )
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: ListTile(
              title: const Text("Eighth Screen"),
              subtitle: const Text("TransForm Two box"),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Eigthth(),
                  ),
                )
              },
            ),
          ),
        ],
      ),
    );
  }
}
