import 'package:flutter/material.dart';

/// Ini adalah class static data atau data yang tidak mungkin berubah, kecuali dirubah sendiri
/// * [textColor] berisi warna utama tulisan
/// * [inputColor] berisi warna utama isian
/// * [bgColor] berisi warna main background
/// * [bgColor2] berisi warna secondary background
abstract class StaticData {
  /// [textColor] nilai defaultnya adalah `#156778`
  static Color textColor = Color(0xFF156778);

  /// [inputColor] nilai defaultnya adalah `#535353`
  static Color inputColor = Color(0xFF535353);

  /// [bgColor] nilai defaultnya adalah `#3A9AD9`
  static Color bgColor = Color(0xFF3A9AD9);

  /// [bgColor2] nilai defaultnya adalah `#F8F8F8`
  static Color bgColor2 = Color(0xFFF8F8F8);
}
