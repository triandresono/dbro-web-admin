import 'package:dbro_admin/core/scroll_behavior/touch_behaviour.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:flutter/material.dart';

class TableParent extends StatelessWidget {
  final Widget child;
  const TableParent({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.ismobile) {
      final controller = ScrollController();
      return ScrollConfiguration(
        behavior: TouchBehavior(),
        child: Scrollbar(
          thumbVisibility: true,
          controller: controller,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            controller: controller,
            child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: AppColor.headerTile.withOpacity(0.1),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  width: 800,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        width: Sizer.fix_width * 0.8,
        child: child,
      );
    }
  }
}
