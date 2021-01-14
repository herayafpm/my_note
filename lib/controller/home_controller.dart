import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_note/firebase_database_util.dart';
import 'package:my_note/toast_util.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeController extends GetxController {
  FirebaseDatabaseUtil databaseUtil;
  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        Get.offAllNamed("/auth/login");
      } else {
        print("data $user");
      }
    });
    databaseUtil = new FirebaseDatabaseUtil();
    databaseUtil.initState();
    super.onInit();
  }

  void logout() {
    showDialog(
        context: Get.context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("Konfirmasi logout"),
              content: Text("Yakin ingin keluar?"),
              actions: [
                FlatButton(
                  child: Text("Batal"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Ya"),
                  onPressed: () {
                    logoutProc();
                  },
                ),
              ],
            ));
  }

  Future<void> logoutProc() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed("/auth/login");
    ToastUtil.success(message: "Anda berhasil logout");
  }
}
