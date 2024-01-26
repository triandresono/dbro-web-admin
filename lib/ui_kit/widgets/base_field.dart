import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BaseField extends StatelessWidget {
  final String? Function(String?)? validator;
  final Function(String)? onTextChanged;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscure;
  final bool enable;
  final bool readOnly;
  final String? hint;
  final double height;
  final Widget? suffixIcon;
  final FloatingLabelBehavior floatingLabelBehavior;
  final EdgeInsetsGeometry contentPadding;
  final Widget? leadingLabel;
  final Widget? trailingWidget;
  final Color? fillColor;
  const BaseField({
    super.key,
    this.inputType = TextInputType.text,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.obscure = false,
    this.enable = true,
    this.readOnly = false,
    this.validator,
    this.onTextChanged,
    required this.controller,
    this.height = 47,
    this.hint,
    this.suffixIcon,
    this.contentPadding = const EdgeInsets.fromLTRB(12, 6, 12, 6),
    this.leadingLabel,
    this.trailingWidget,
    this.fillColor,
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
              return MouseRegion(
                onEnter: (_) => onHover(true),
                onExit: (_) => onHover(false),
                child: Container(
                  height: (this).height,
                  decoration: BoxDecoration(
                    color: (state.hasError)
                        ? AppColor.error1
                        : (this).enable
                            ? fillColor ?? Colors.transparent
                            : AppColor.snowGray,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: state.hasError.either(
                        is_true: AppColor.error1,
                        is_false: hasfocus.value.either(
                          is_true: AppColor.mainOrange,
                          is_false: onHover.value.either(
                            is_true: AppColor.mainOrange,
                            is_false: AppColor.primaryFieldBorder,
                          ),
                        ),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: (this).height,
                        child: ClipRRect(
                          // width: 12.w,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(8),
                          // ),
                          // borderRadius: borderRadius: BorderRadius.circular(8),,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            bottomLeft: Radius.circular(6),
                          ),
                          child: (this).leadingLabel ?? const SizedBox(),
                        ),
                      ),
                      Expanded(
                        child: Focus(
                          onFocusChange: (value) {
                            hasfocus(value);
                          },
                          child: TextFormField(
                            readOnly: (this).readOnly,
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
                              // prefixIcon: (this).leadingLabel,
                              contentPadding: (this).contentPadding,
                              errorStyle: const TextStyle(height: 0.01),
                              floatingLabelBehavior:
                                  (this).floatingLabelBehavior,
                              hintText: (this).hint,
                              border: InputBorder.none,
                              suffixIcon: (this).suffixIcon,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: (this).height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: (this).trailingWidget ?? const SizedBox(),
                      ),
                    ],
                  ),
                ),
              );
            }),
            if (state.hasError) SizedBox(height: 1.0.h),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  state.errorText ?? '',
                  // style: Font.style.size14.regular(
                  //   color: ColorName.error,
                  // ),
                ),
              )
          ],
        );
      },
    );
  }
}
