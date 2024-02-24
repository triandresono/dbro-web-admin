import 'package:dbro_admin/ui_kit/state/case.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/widgets/blank_builder.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class NoPermissionPage extends StatelessWidget {
  final Widget child;
  final List<Rx<Case>> cases;
  final double? height;
  const NoPermissionPage({
    super.key,
    required this.child,
    required this.cases,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final unauthorized = cases.any((e) => e.value is UnauthorizedCase);
      return BlankBuilder(() {
        if (unauthorized) {
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
                    "Sorry.",
                    style: Font.fix(21).medium(
                      color: AppColor.headerTile,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "You have no access to this feature.",
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
      });
    });
  }
}
