import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ComingSoonPage extends StatelessWidget {
  final double? height;
  const ComingSoonPage({
    super.key,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              IconlyLight.time_square,
              size: Sizer.fix_height * 0.07,
              color: AppColor.mainOrange,
            ),
            const SizedBox(height: 8),
            Text(
              "Sorry.",
              style: Font.fix(21).medium(
                color: AppColor.headerTile,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "This feature will be coming soon later",
              style: Font.fix(13).regular(
                color: AppColor.headerTile,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
