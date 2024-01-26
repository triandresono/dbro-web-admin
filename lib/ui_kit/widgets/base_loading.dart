import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BaseLoading extends StatelessWidget {
  final double size;
  const BaseLoading({
    super.key,
    this.size = 47,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: LoadingAnimationWidget.horizontalRotatingDots(
          color: AppColor.mainOrange,
          size: size,
        ),
      ),
    );
  }
}

class BaseCircullar extends StatelessWidget {
  final Color? bgColor;
  const BaseCircullar({
    super.key,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: CircularProgressIndicator(
          backgroundColor: bgColor ?? Colors.grey.withOpacity(0.3),
          color: AppColor.mainOrange,
          strokeWidth: 2.5,
        ),
      ),
    );
  }
}
