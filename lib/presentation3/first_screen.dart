import 'package:flutter/material.dart';

class FirstScreenFrom3 extends StatefulWidget {
  const FirstScreenFrom3({super.key});

  @override
  State<FirstScreenFrom3> createState() => _FirstScreenFrom3State();
}

class _FirstScreenFrom3State extends State<FirstScreenFrom3> {
  bool firstContainer = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Containers"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: firstContainer
                    ? Container(
                        key: UniqueKey(),
                        color: Colors.red,
                        width: 150,
                        height: 150,
                        child: const Center(
                          child: Text(
                            "This is first container",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Container(
                        key: UniqueKey(),
                        color: Colors.blue,
                        height: 150,
                        width: 150,
                        child: const Center(
                            child: Text(
                          "This is second container",
                          textAlign: TextAlign.center,
                        )),
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () => {
                  setState(
                    () => {firstContainer = !firstContainer},
                  )
                },
                child: Container(
                    color: Colors.grey,
                    padding: const EdgeInsets.all(10),
                    child: const Text("Change container")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
