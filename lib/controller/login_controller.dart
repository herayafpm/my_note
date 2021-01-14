import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_note/toast_util.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final showPass = false.obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user != null) {
        Get.offAllNamed("/home");
        ToastUtil.success(message: "Anda berhasil login");
      }
    });
    super.onInit();
  }

  Future<void> login() async {
    isLoading.value = true;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'user-not-found') {
        ToastUtil.error(message: "Email atau password salah");
        return;
      } else if (e.code == 'wrong-password') {
        ToastUtil.error(message: "Email atau password salah");
        return;
      }
      ToastUtil.error(message: "Email atau password salah");
      return;
    }
  }
}
