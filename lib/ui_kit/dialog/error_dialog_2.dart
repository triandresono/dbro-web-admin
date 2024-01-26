import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/sizer.dart';
import 'package:dbro_admin/ui_kit/widgets/base_button_icon.dart';
import 'package:dbro_admin/utils/constants/enumeration.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ErrorDialog2 extends StatelessWidget {
  final String? title;
  final String desc;
  final String? secondaryTitle;
  final String mainButtonTitle;
  const ErrorDialog2({
    super.key,
    this.secondaryTitle,
    this.mainButtonTitle = "Okay",
    this.title,
    this.desc = '',
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Adaptive.sp(12.0)),
        ),
      ),
      child: SizedBox(
        width: Sizer.fix_width * 0.25,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null) ...[
              const SizedBox(height: 18),
              Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: Font.fix(18).bold(
                  color: AppColor.headerTile,
                ),
              ),
            ],
            const SizedBox(height: 12),
            if (desc.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: Font.fix(15).regular(
                    color: AppColor.headerTile,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: BaseButtonIcon(
                      title: mainButtonTitle,
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ),
                  if (secondaryTitle != null) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      child: BaseButtonIcon(
                        title: secondaryTitle ?? '',
                        colorType: ColorType.WHITE,
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
