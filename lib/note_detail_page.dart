import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/note_model.dart';
import 'package:my_note/static_data.dart';

class NoteDetailPage extends StatelessWidget {
  NoteModel note;
  @override
  Widget build(BuildContext context) {
    note = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StaticData.bgColor,
        title: Text("${note.title}"),
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Get.toNamed("/note/form", arguments: note);
              }),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              width: Get.width,
              height: Get.height,
              child:
                  Text(note.content, style: TextStyle(color: Colors.black87))),
        ),
      ),
    );
  }
}
