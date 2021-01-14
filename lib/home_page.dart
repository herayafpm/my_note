import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/controller/home_controller.dart';
import 'package:my_note/note_model.dart';
import 'package:my_note/static_data.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomeController());
  bool _anchorToBottom = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: StaticData.bgColor,
        title: Text("My Note"),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                controller.logout();
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed("/note/form");
        },
      ),
      body: new FirebaseAnimatedList(
        key: new ValueKey<bool>(false),
        query: controller.databaseUtil.getNotes(),
        reverse: _anchorToBottom,
        sort: _anchorToBottom
            ? (DataSnapshot a, DataSnapshot b) => b.key.compareTo(a.key)
            : null,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          NoteModel note = NoteModel(
              uid: snapshot.key,
              title: snapshot.value['title'],
              content: snapshot.value['content']);
          return new SizeTransition(
            sizeFactor: animation,
            child: ListTile(
                title: Text("${note.title}"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext bc) {
                        return Container(
                            child: Wrap(children: [
                          ListTile(
                            leading: Icon(Icons.visibility),
                            title: Text('Detail'),
                            onTap: () {
                              Navigator.pop(context);
                              Get.toNamed("/note/detail", arguments: note);
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('Edit'),
                            onTap: () {
                              Navigator.pop(context);
                              Get.toNamed("/note/form", arguments: note);
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('Delete'),
                            onTap: () {
                              Navigator.pop(context);
                              controller.databaseUtil.deleteNote(note);
                            },
                          ),
                        ]));
                      });
                }),
          );
        },
      ),
    );
  }
}
