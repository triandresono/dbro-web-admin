import 'package:dbro_admin/utils/utils/util.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class NoParameterPage extends StatelessWidget {
  final Widget child;
  final double? height;
  final int paramLength;
  const NoParameterPage({
    super.key,
    required this.child,
    this.height,
    required this.paramLength,
  });

  @override
  Widget build(BuildContext context) {
    if (Util.rawParameter.length < paramLength) {
      return Center(
        child: SizedBox(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                IconlyLight.lock,
                size: Sizer.fix_height * 0.07,
                color: AppColor.mainOrange,
              ),
              const SizedBox(height: 8),
              Text(
                "404",
                style: Font.fix(21).medium(
                  color: AppColor.headerTile,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Page not found",
                style: Font.fix(13).regular(
                  color: AppColor.headerTile,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return child;
    }
  }
}
