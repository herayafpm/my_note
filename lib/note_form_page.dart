import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/controller/home_controller.dart';
import 'package:my_note/controller/note_controller.dart';
import 'package:my_note/note_model.dart';
import 'package:my_note/static_data.dart';

class NoteFormPage extends StatelessWidget {
  final controller = Get.put(NoteController());
  NoteModel note;
  @override
  Widget build(BuildContext context) {
    note = Get.arguments;
    if (note != null) {
      controller.titleController.text = note.title;
      controller.contentController.text = note.content;
    } else {
      controller.titleController.text = "No Title";
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StaticData.bgColor,
        title: TextFormField(
          controller: controller.titleController,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: "Fill title"),
          style: TextStyle(color: Colors.white),
          autofocus: true,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () {
              NoteModel newNote = NoteModel(
                  title: controller.titleController.text,
                  content: controller.contentController.text);
              if (note != null) {
                newNote.uid = note.uid;
                controller.databaseUtil.updateNote(newNote);
              } else {
                controller.databaseUtil.addNote(newNote);
              }
              Get.offAllNamed("/home");
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: controller.contentController,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: "Fill content"),
          keyboardType: TextInputType.multiline,
          minLines: 99,
          maxLines: 99,
        ),
      ),
    );
  }
}
