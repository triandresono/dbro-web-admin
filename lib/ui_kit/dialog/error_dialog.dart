import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/widgets/base_button_icon.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ErrorDialog extends StatelessWidget {
  final String? title;
  final String desc;
  final String? secondaryTitle;
  final String mainButtonTitle;
  const ErrorDialog({
    super.key,
    this.secondaryTitle,
    this.mainButtonTitle = "Okay",
    this.title,
    this.desc = '',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        contentPadding: const EdgeInsets.all(23),
        buttonPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Adaptive.sp(12.0)),
          ),
        ),
        title: (title != null).either(
          is_false: null,
          is_true: Text(
            title ?? '',
            textAlign: TextAlign.center,
            style: Font.fix(17).semiBold(
              color: AppColor.headerTile,
            ),
          ),
        ),
        content: (desc.isNotEmpty).either(
          is_false: const SizedBox.shrink(),
          is_true: Text(
            desc,
            textAlign: TextAlign.center,
            style: Font.fix(15).regular(
              color: AppColor.headerTile,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: BaseButtonIcon(
                    title: mainButtonTitle,
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ),
                if (secondaryTitle != null)
                  Padding(
                    padding: EdgeInsets.only(top: Adaptive.sp(6.0)),
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(
                        secondaryTitle ?? '',
                        style: Font.size(15.5).bold(
                          color: AppColor.headerTile,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
