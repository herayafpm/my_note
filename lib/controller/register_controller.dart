import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_note/toast_util.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final showPass = false.obs;
  final isLoading = false.obs;

  Future<void> register() async {
    isLoading.value = true;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'weak-password') {
        ToastUtil.error(message: "Password terlalu lemah");
        return;
      } else if (e.code == 'email-already-in-use') {
        ToastUtil.error(message: "Email sudah digunakan");
        return;
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
      ToastUtil.error(message: "$e");
      return;
    }
  }
}
