import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_note/firebase_database_util.dart';

class NoteController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  FirebaseDatabaseUtil databaseUtil;
  void onInit() {
    databaseUtil = new FirebaseDatabaseUtil();
    databaseUtil.initState();
    super.onInit();
  }
}
