import 'package:flutter/cupertino.dart';

class AppLayout {
  /// Device Width
  static double width(BuildContext context) => MediaQuery.of(context).size.width;

  /// Device text scale Factor set to 1.0
  static MediaQueryData appScaleFactor(BuildContext context) => MediaQuery.of(context).copyWith(textScaleFactor: 1.0);
}
