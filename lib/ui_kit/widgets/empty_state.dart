import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class EmptyState extends StatelessWidget {
  final Widget child;
  final bool emptyCondition;
  const EmptyState({
    super.key,
    required this.child,
    required this.emptyCondition,
  });

  @override
  Widget build(BuildContext context) {
    if (emptyCondition) {
      return Center(
        child: Container(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                IconlyLight.search,
                size: Sizer.fix_height * 0.07,
                color: AppColor.mainOrange,
              ),
              const SizedBox(height: 8),
              Text(
                "No data",
                style: Font.fix(21).medium(
                  color: AppColor.headerTile,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Data was empty",
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
