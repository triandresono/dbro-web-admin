import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:flutter/material.dart';

class BaseDialogAppbar extends StatelessWidget {
  final String title;
  const BaseDialogAppbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  title,
                  style: Font.fix(20).semiBold(
                    color: AppColor.headerTile,
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.close_rounded,
                    color: AppColor.headerTile,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Divider(
          color: AppColor.headerTile.withOpacity(0.5),
          height: 1,
        ),
      ],
    );
  }
}
