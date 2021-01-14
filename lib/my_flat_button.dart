import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note/static_data.dart';

class MyFlatButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const MyFlatButton({this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(onTap),
      child: Txt("$title",
          style: TxtStyle()
            ..textColor(StaticData.textColor)
            ..fontSize(12)
            ..textAlign.right()),
      style: ParentStyle()..width(Get.width * 0.8),
    );
  }
}
