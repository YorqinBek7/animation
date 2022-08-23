import 'package:flutter/material.dart';

class DecorationTween1 extends StatefulWidget {
  const DecorationTween1({
    super.key,
  });

  @override
  State<DecorationTween1> createState() => _DecorationTweenState();
}

class _DecorationTweenState extends State<DecorationTween1>
    with TickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.red,
      boxShadow: const [
        BoxShadow(
          color: Colors.yellow,
          offset: Offset(1, 1),
          spreadRadius: 10,
          blurRadius: 10,
        )
      ],
    ),
    end: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Colors.amber,
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(1, 1),
          spreadRadius: 10,
          blurRadius: 10,
        )
      ],
    ),
  );

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 1))
        ..repeat(reverse: true);
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: DecoratedBoxTransition(
            decoration: decorationTween.animate(_controller),
            child: Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.all(10),
            ),
          ),
        ),
      ),
    );
  }
}
