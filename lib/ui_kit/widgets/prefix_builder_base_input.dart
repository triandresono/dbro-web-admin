import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_widget.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PrefixBaseInput extends StatelessWidget {
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onTextChanged;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscure;
  final bool enable;
  final String hint;
  final double height;
  final Widget? suffixIcon;
  final FloatingLabelBehavior floatingLabelBehavior;
  final EdgeInsetsGeometry contentPadding;
  final Widget Function(Color)? leading;
  final Widget Function(Color)? trailing;
  final Color? fillColor;
  final Color? labelBgColor;
  const PrefixBaseInput({
    super.key,
    this.inputType = TextInputType.text,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.obscure = false,
    this.enable = true,
    this.validator,
    this.onTextChanged,
    required this.controller,
    this.height = 47,
    this.hint = "Please Input",
    this.suffixIcon,
    this.contentPadding = const EdgeInsets.fromLTRB(12, 6, 12, 6),
    this.leading,
    this.trailing,
    this.fillColor,
    this.onFieldSubmitted,
    this.labelBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: ((this).validator != null)
          ? (v) => (this).validator?.call(controller.text)
          : null,
      builder: (state) {
        var hasfocus = false.obs;
        var onHover = false.obs;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              var color = _crx(hasfocus.value, onHover.value, state.hasError);
              return MouseRegion(
                onEnter: (_) => onHover(true),
                onExit: (_) => onHover(false),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: (this).height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: color),
                        color: state.hasError.either(
                          is_true: AppColor.error1,
                          is_false: enable.either(
                            is_true: fillColor ?? Colors.transparent,
                            is_false: fillColor ?? AppColor.snowGray,
                          ),
                        ),
                      ),
                      child: Row(children: [
                        SizedBox(
                          height: (this).height,
                          child: leading?.call(color) ?? const SizedBox(),
                        ),
                        Expanded(
                          child: Focus(
                            onFocusChange: (value) {
                              hasfocus(value);
                            },
                            child: TextFormField(
                              onFieldSubmitted: (this).onFieldSubmitted,
                              controller: (this).controller,
                              keyboardType: (this).inputType,
                              obscureText: (this).obscure,
                              enabled: (this).enable,
                              onChanged: (this).onTextChanged,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: (this).contentPadding,
                                errorStyle: const TextStyle(height: 0.01),
                                floatingLabelBehavior:
                                    (this).floatingLabelBehavior,
                                hintText: hasfocus.value.either(
                                  is_true: '',
                                  is_false: (this).hint,
                                ),
                                border: InputBorder.none,
                                suffixIcon: (this).suffixIcon,
                                hintStyle: TextStyle(
                                  color: _crx2(
                                    hasfocus.value,
                                    onHover.value,
                                    state.hasError,
                                  ),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: (this).height,
                          child: trailing?.call(color) ?? const SizedBox(),
                        ),
                      ]),
                    ),
                    if (hasfocus.value || controller.text.isNotEmpty)
                      Positioned(
                        top: -7,
                        left: 12,
                        child: SwitcherWidget(
                          child: Container(
                            color: labelBgColor ?? AppColor.appGrayBg,
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Text(
                              (this).hint,
                              style: TextStyle(
                                fontSize: 11,
                                color: _crx2(
                                  hasfocus.value,
                                  onHover.value,
                                  state.hasError,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }),
            if (state.hasError) SizedBox(height: 1.0.h),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  state.errorText ?? '',
                ),
              )
          ],
        );
      },
    );
  }

  Color _crx(bool hasfocus, bool ishover, bool haserror) {
    if (enable == true) {
      return haserror.either(
        is_true: AppColor.error1,
        is_false: hasfocus.either(
          is_true: AppColor.mainOrange,
          is_false: ishover.either(
            is_true: AppColor.mainOrange,
            is_false: AppColor.primaryFieldBorder,
          ),
        ),
      );
    } else {
      return AppColor.primaryFieldBorder;
    }
  }

  Color _crx2(bool hasfocus, bool ishover, bool haserror) {
    if (enable == true) {
      return haserror.either(
        is_true: AppColor.error1,
        is_false: hasfocus.either(
          is_true: AppColor.mainOrange,
          is_false: ishover.either(
            is_true: AppColor.mainOrange,
            is_false: Colors.grey,
          ),
        ),
      );
    } else {
      return Colors.grey;
    }
  }
}
