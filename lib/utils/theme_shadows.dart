import 'package:flutter/material.dart';

abstract class ThemeShadows {
  static const commonShadow =
      BoxShadow(offset: Offset(0, 0), blurRadius: 20, color: Color.fromRGBO(191, 197, 245, 0.15));

  static const commonShadow2 = BoxShadow(offset: Offset(0, 0), blurRadius: 20, color: Color.fromRGBO(0, 0, 0, 0.15));
  static const commonShadow3 =
      BoxShadow(offset: Offset(0, -5), blurRadius: 20, color: Color.fromRGBO(76, 95, 143, 0.2));
}
