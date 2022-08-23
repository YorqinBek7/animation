import 'package:animation/presentation3/first_screen.dart';
import 'package:animation/presentation3/fourth_screen.dart';
import 'package:animation/presentation3/loading.dart';
import 'package:animation/presentation3/my_animation/splash_screen.dart';
import 'package:animation/presentation3/second_screen.dart';
import 'package:animation/presentation3/third_screen/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPresentation extends StatefulWidget {
  const MainPresentation({super.key});

  @override
  State<MainPresentation> createState() => _MainPresentationState();
}

class _MainPresentationState extends State<MainPresentation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 245, 245),
      appBar: AppBar(
        title: const Text(
          "Main Presentation",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 247, 245, 245),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Color.fromARGB(255, 247, 245, 245),
            statusBarIconBrightness: Brightness.dark),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              child: ListTile(
                title: const Text("Change Containers"),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FirstScreenFrom3(),
                    ),
                  )
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              child: ListTile(
                title: const Text("Loading with percents"),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondScreenFrom3(),
                    ),
                  )
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              child: ListTile(
                title: const Text("Login page"),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThirdScreenFrom3(),
                    ),
                  )
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              child: ListTile(
                title: const Text("Loading screen"),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Loading(),
                    ),
                  )
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              child: ListTile(
                title: const Text("AnimatedBoxDecoration"),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BoxTranstion(),
                    ),
                  )
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              child: ListTile(
                title: const Text("My Animation"),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SplashScreenNotes(),
                    ),
                  )
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
