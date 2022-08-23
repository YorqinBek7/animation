import 'package:animation/presentation3/third_screen/login_screen.dart';
import 'package:flutter/material.dart';

class ThirdScreenFrom3 extends StatefulWidget {
  const ThirdScreenFrom3({super.key});

  @override
  State<ThirdScreenFrom3> createState() => _ThirdScreenFrom3State();
}

class _ThirdScreenFrom3State extends State<ThirdScreenFrom3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.grey, spreadRadius: 5, blurRadius: 5)
        ], color: Colors.white),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.flash_on,
                    color: Colors.amber,
                    size: 80,
                  ),
                  Text(
                    "Flash Chat",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const LoginScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(1, 0);
                                const end = Offset.zero;
                                final tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: Curves.linear));
                                final offsetAnimation = animation.drive(tween);
                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              }),
                        );
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(15),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.lightBlue),
                      ),
                      child: const Text(
                        "Log In",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(15),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue.shade600),
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
