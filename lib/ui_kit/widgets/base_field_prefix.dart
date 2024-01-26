import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:flutter/material.dart';

class BaseFieldPrefixWidget extends StatelessWidget {
  final Widget icon;
  final bool enable;
  final Color? color;
  final BorderRadiusGeometry? border;
  const BaseFieldPrefixWidget({
    super.key,
    required this.icon,
    this.enable = true,
    this.color,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: color ?? AppColor.mainOrange.withOpacity(0.9),
        borderRadius: border,
      ),
      child: Center(
        child: icon,
      ),
    );
  }
}

class FieldIconPrefix extends StatelessWidget {
  final Widget icon;
  final bool enable;
  final Color? color;
  final BorderRadiusGeometry? border;
  const FieldIconPrefix({
    super.key,
    required this.icon,
    this.enable = true,
    this.color,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Center(
        child: icon,
      ),
    );
  }
}

class FieldIconSuffix extends StatelessWidget {
  final Widget icon;
  final bool enable;
  final Color? color;
  final BorderRadiusGeometry? border;
  final EdgeInsetsGeometry padding;
  const FieldIconSuffix({
    super.key,
    required this.icon,
    this.enable = true,
    this.color,
    this.border,
    this.padding = const EdgeInsets.only(right: 10),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: icon,
      ),
    );
  }
}
