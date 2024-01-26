import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:flutter/material.dart';

class Bar {
  String? title;
  Color? color;
  VoidCallback? onTap;

  //HELPER
  int? index;

  Bar({
    this.title,
    this.color = AppColor.greyField,
    this.onTap,

    //HELPER
    this.index = 0,
  });
}
