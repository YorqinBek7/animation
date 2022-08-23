import 'package:animation/data/cached_data.dart';
import 'package:animation/data/local_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  TextEditingController textController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 245, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 245, 245),
        elevation: 0,
        leading: IconButton(
          onPressed: (() => {
                Navigator.pop(context),
              }),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
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
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              "Add to your notes",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(fontSize: 25),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: textController,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: "Add to your notes",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pop(context);
          await LocalDataBase.addToNotes(
            NotesTable(
              date: DateTime.now().toString(),
              subtitle: textController.text,
              title: titleController.text,
            ),
          );
          setState(
            () => {},
          );
        },
        child: const Text("Save"),
      ),
    );
  }
}
