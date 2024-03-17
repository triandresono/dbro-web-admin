import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/widgets/base_button_icon.dart';
import 'package:dbro_admin/utils/constants/enumeration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final String okButton;
  final String cancelButton;
  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    required this.okButton,
    required this.cancelButton,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: AppColor.appGrayBg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        width: Sizer.fix_width * 0.25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Icon(
              FeatherIcons.helpCircle,
              color: AppColor.mainOrange,
              size: Sizer.fix_height * 0.07,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: Font.fix(24).bold(
                color: AppColor.headerTile,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: Font.fix(16).regular(
                color: AppColor.headerTile,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                BaseButtonIcon(
                  colorType: ColorType.WHITE,
                  title: cancelButton,
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                const SizedBox(width: 12),
                BaseButtonIcon(
                  title: okButton,
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
