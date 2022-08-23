import 'package:flutter/material.dart';

class Fifth extends StatefulWidget {
  const Fifth({super.key});

  @override
  State<Fifth> createState() => _FifthState();
}

class _FifthState extends State<Fifth> {
  double _size = 100;
  bool size = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Center(
            child: Stack(children: [
              Positioned(
                left: 0,
                right: 0,
                child: AnimatedSize(
                  duration: const Duration(seconds: 2),
                  child: Container(
                    width: _size = size ? 100 : 250,
                    height: _size = size ? 100 : 250,
                    decoration: BoxDecoration(
                     
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                  ),
                ),
              ),
              
              AnimatedSize(
                duration: const Duration(seconds: 2),
                child: Container(
                  width: _size = size ? 250 : 100,
                  height: _size = size ? 250 : 100,
                  decoration: BoxDecoration(
                    color: Colors.cyan.shade800,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: const Center(
                    child: Text(
                      "YorqinBek Yuldashev",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() => {
                setState(
                  () => {
                    size = !size,
                  },
                )
              }),
        ));
  }
}
