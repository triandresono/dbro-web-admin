import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/widgets/blank_builder.dart';
import 'package:flutter/material.dart';

class TableButton extends StatelessWidget {
  final Function() onTap;
  final String tips;
  final IconData icon;
  final double iconSize;
  final bool enabled;
  final Color color;
  const TableButton({
    Key? key,
    required this.onTap,
    required this.tips,
    required this.icon,
    this.iconSize = 17,
    this.enabled = true,
    this.color = AppColor.projectPrimary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: BlankBuilder(() {
        if (enabled) {
          return InkWell(
            hoverColor: color.withOpacity(0.2),
            onTap: onTap,
            child: Tooltip(
              message: tips,
              child: Icon(
                icon,
                color: color,
                size: iconSize,
              ),
            ),
          );
        } else {
          return Icon(
            icon,
            color: AppColor.greyField,
            size: iconSize,
          );
        }
      }),
    );
  }
}
