import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/static_data.dart';

class AuthTemplate extends StatelessWidget {
  final Widget body;
  final String title;

  const AuthTemplate({this.body, this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(
            height: Get.height * 0.1,
          ),
          Align(
              alignment: Alignment.center,
              child: Container(
                child: Txt("$title",
                    style: TxtStyle()
                      ..textColor(StaticData.textColor)
                      ..bold()
                      ..fontSize(15)
                      ..textAlign.center()),
              )),
          SizedBox(
            height: 40,
          ),
          body
        ],
      ),
    );
  }
}
