import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:dbro_admin/utils/constants/enumeration.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BaseButton extends StatelessWidget {
  final ButtonType type;
  final String title;
  final VoidCallback onPressed;
  final double? height;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final ColorType colorType;
  final Color borderColor;
  final bool isFillWidth;
  final bool isDisabled;
  final BorderRadiusGeometry? borderRadius;
  final double elevation;
  final TextStyle? textStyle;

  const BaseButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.type = ButtonType.PRIMARY,
    this.isFillWidth = false,
    this.isDisabled = false,
    this.colorType = ColorType.PRIMARY,
    this.borderColor = AppColor.grey,
    this.height,
    this.paddingVertical,
    this.paddingHorizontal,
    this.borderRadius,
    this.elevation = 0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFillWidth ? double.infinity : null,
      height: (height != null) ? height : null,
      child: MaterialButton(
        elevation: (this).elevation,
        focusElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          side: isDisabled.either(
            is_true: BorderSide.none,
            is_false: BorderSide(
              color: colorType.color,
            ),
          ),
        ),
        color: (type == ButtonType.PRIMARY).either(
          is_true: colorType.color,
          is_false: Colors.white,
        ),
        disabledColor: AppColor.snowGray,
        padding: EdgeInsets.symmetric(
          horizontal: (paddingHorizontal != null).either(
            is_true: paddingHorizontal?.w,
            is_false: 3.24.w,
          ),
          vertical: (paddingVertical != null).either(
            is_true: paddingVertical?.h,
            is_false: 20.0,
          ),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: Text(
          title,
          style: textStyle?.copyWith(
                color: (isDisabled).either(
                  is_true: AppColor.grey1,
                  is_false: colorType.textColor,
                ),
              ) ??
              Font.fix(15.5).bold(color: colorType.textColor),
        ),
      ),
    );
  }
}
