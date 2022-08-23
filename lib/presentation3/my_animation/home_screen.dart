import 'dart:math';

import 'package:animation/data/cached_data.dart';
import 'package:animation/data/local_database.dart';
import 'package:animation/presentation3/my_animation/add_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation<double> animation2;
  late CurvedAnimation curvedAnimation;
  List<NotesTable> list = [];
  bool isTap = false;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation2 = Tween<double>(begin: 0.0, end: 2 * pi).animate(controller);
    controller.addListener(() {
      if (controller.isCompleted) {
        controller.reset();
      }
      setState(() {});
    });
    _init();
    super.initState();
  }

  _init() async {
    list = await LocalDataBase.getAllNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _init();
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 245, 245),
        floatingActionButton: FloatingActionButton(
          child: RotationTransition(
            turns: animation2,
            child: const Icon(
              Icons.edit,
              size: 30,
            ),
          ),
          onPressed: () async {
            setState(() {});
            controller.forward();
            await Future.delayed(const Duration(milliseconds: 1500));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddNotesScreen(),
              ),
            );
          },
        ),
        appBar: AppBar(
          title: const Text(
            "Your Notes",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: const Color.fromARGB(255, 247, 245, 245),
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarColor: Color.fromARGB(255, 247, 245, 245),
              statusBarIconBrightness: Brightness.dark),
          actions: const [
            Icon(
              Icons.settings,
              color: Colors.black,
            ),
            SizedBox(width: 10),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: ListTile(
                      title: Text(
                        list[index].title.length > 10
                            ? "${list[index].title.substring(0, 10)}..."
                            : list[index].title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index].subtitle.length > 4
                                ? "${list[index].subtitle.substring(0, 4)}..."
                                : list[index].subtitle,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            list[index].date.substring(0, 16),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
