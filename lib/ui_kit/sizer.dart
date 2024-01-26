// ignore_for_file: avoid_web_libraries_in_flutter, non_constant_identifier_names

import 'package:universal_html/html.dart';

class Sizer {
  static double get fix_height {
    var height = window.screen?.height ?? 0;
    return height.toDouble();
  }

  static double get fix_width {
    var width = window.screen?.width ?? 0;
    return width.toDouble();
  }
}
