import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/utils/constants/enumeration.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:flutter/material.dart';

class BaseButtonIcon extends StatelessWidget {
  final ButtonType type;
  final String title;
  final VoidCallback onPressed;
  final IconData? icon;
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

  const BaseButtonIcon({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
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
    return TextButton(
      onPressed: isDisabled ? null : () => onPressed.call(),
      style: TextButton.styleFrom(
        fixedSize: const Size.fromHeight(30),
        backgroundColor: isDisabled ? Colors.grey : colorType.color,
        minimumSize: const Size(88, 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isDisabled ? Colors.grey : colorType.borderColor,
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Font.fix(14).medium(
                    color: colorType.textColor,
                  ),
                ),
                if (icon != null)
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      Icon(
                        icon,
                        size: 17,
                        color: colorType.textColor,
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
