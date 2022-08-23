import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  bool isPlay = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            duration: const Duration(seconds: 1),
            style: TextStyle(
              color: isPlay ? Colors.red : Colors.blue,
              fontSize: isPlay ? 70 : 40,
            ),
            child: const Text(
              "Hello Flutter, World",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => {
                  setState(
                    () => {
                      isPlay = true,
                    },
                  )
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.play_arrow),
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: (() => {
                      setState(
                        () => {
                          isPlay = false,
                        },
                      )
                    }),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.settings_backup_restore),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
