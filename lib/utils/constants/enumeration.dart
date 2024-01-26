// ignore_for_file: constant_identifier_names

import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:flutter/material.dart';

enum ButtonType { PRIMARY, SECONDARY }

enum ColorType {
  PRIMARY(
    color: AppColor.mainOrange,
    textColor: Colors.white,
    borderColor: AppColor.mainOrange,
  ),
  WHITE(
    color: Colors.white,
    textColor: AppColor.mainOrange,
    borderColor: AppColor.mainOrange,
  );

  const ColorType({
    required this.color,
    required this.textColor,
    required this.borderColor,
  });

  final Color color;
  final Color textColor;
  final Color borderColor;
}
