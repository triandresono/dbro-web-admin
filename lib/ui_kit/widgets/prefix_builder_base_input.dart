import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_widget.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PrefixBaseInput extends StatefulWidget {
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onTextChanged;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType inputType;
  final bool obscure;
  final bool enable;
  final bool readonly;
  final String hint;
  final double? height;
  final Widget? suffixIcon;
  final int minLines;
  final int maxLines;
  final FloatingLabelBehavior floatingLabelBehavior;
  final EdgeInsetsGeometry contentPadding;
  final Widget Function(Color)? leading;
  final Widget Function(Color)? trailing;
  final Color? fillColor;
  final Color? labelBgColor;
  final VoidCallback? onTap;

  PrefixBaseInput({
    super.key,
    this.inputType = TextInputType.text,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.inputFormatters,
    this.textInputAction,
    this.obscure = false,
    this.enable = true,
    this.readonly = false,
    this.minLines = 1,
    this.maxLines = 1,
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
    this.onTap,
  });

  @override
  State<PrefixBaseInput> createState() => _PrefixBaseInputState();
}

class _PrefixBaseInputState extends State<PrefixBaseInput> {
  final hasfocus = false.obs;
  final onHover = false.obs;
  final error = Rxn<String>(null);
  void _listen() {
    if (widget.validator != null) {
      error.value = widget.validator?.call(widget.controller.text);
    }
  }

  @override
  void initState() {
    widget.controller.addListener(_listen);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: ((this).widget.validator != null)
          ? (v) => (this).widget.validator?.call(widget.controller.text)
          : null,
      builder: (state) {
        return Obx(() {
          final data = error.value;
          final color = _crx(hasfocus.value, onHover.value, data != null);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              MouseRegion(
                onEnter: (_) => onHover(true),
                onExit: (_) => onHover(false),
                cursor: widget.onTap != null
                    ? SystemMouseCursors.click
                    : MouseCursor.defer,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    InkWell(
                      onTap: widget.onTap != null
                          ? () => widget.onTap?.call()
                          : null,
                      mouseCursor: widget.onTap != null
                          ? SystemMouseCursors.click
                          : SystemMouseCursors.text,
                      child: IgnorePointer(
                        ignoring:
                            widget.onTap != null && widget.readonly == true,
                        child: Container(
                          height: (this).widget.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: color),
                            color: (data != null).either(
                              is_true: widget.fillColor ?? Colors.transparent,
                              is_false: widget.enable.either(
                                is_true: widget.fillColor ?? Colors.transparent,
                                is_false: widget.fillColor ?? AppColor.snowGray,
                              ),
                            ),
                          ),
                          child: Row(children: [
                            SizedBox(
                              height: (this).widget.height,
                              child: widget.leading?.call(color) ??
                                  const SizedBox(),
                            ),
                            Expanded(
                              child: Focus(
                                onFocusChange: (value) {
                                  if (widget.readonly == false) {
                                    hasfocus(value);
                                  }
                                  if (widget.validator != null) {
                                    if (value == false) {
                                      error.value = widget.validator
                                          ?.call(widget.controller.text);
                                    }
                                  }
                                },
                                child: TextFormField(
                                  inputFormatters: widget.inputFormatters,
                                  textInputAction: widget.textInputAction,
                                  readOnly: widget.readonly,
                                  maxLines: widget.maxLines,
                                  minLines: widget.minLines,
                                  onFieldSubmitted:
                                      (this).widget.onFieldSubmitted,
                                  controller: (this).widget.controller,
                                  keyboardType: (this).widget.inputType,
                                  obscureText: (this).widget.obscure,
                                  enabled: (this).widget.enable,
                                  onChanged: (this).widget.onTextChanged,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding:
                                        (this).widget.contentPadding,
                                    errorStyle: const TextStyle(height: 0.01),
                                    floatingLabelBehavior:
                                        (this).widget.floatingLabelBehavior,
                                    hintText: hasfocus.value.either(
                                      is_true: '',
                                      is_false: (this).widget.hint,
                                    ),
                                    border: InputBorder.none,
                                    suffixIcon: (this).widget.suffixIcon,
                                    hintStyle: TextStyle(
                                      color: _crx2(
                                        hasfocus.value,
                                        onHover.value,
                                        data != null,
                                      ),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: (this).widget.height,
                              child: widget.trailing?.call(color) ??
                                  const SizedBox(),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    if (hasfocus.value || widget.controller.text.isNotEmpty)
                      Positioned(
                        top: -7,
                        left: 12,
                        child: SwitcherWidget(
                          child: Container(
                            decoration: BoxDecoration(
                              color: widget.labelBgColor ?? AppColor.appGrayBg,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              (this).widget.hint,
                              style: TextStyle(
                                fontSize: 11,
                                color: _crx2(
                                  hasfocus.value,
                                  onHover.value,
                                  data != null,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              AnimatedVisibiity(
                show: data != null,
                child: Padding(
                  padding: const EdgeInsets.only(left: 3).copyWith(top: 5),
                  child: Text(
                    state.errorText ?? '',
                    style: Font.fix(12).regular(
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              )
            ],
          );
        });
      },
    );
  }

  Color _crx(bool hasfocus, bool ishover, bool haserror) {
    if (widget.enable == true) {
      return haserror.either(
        is_true: Colors.redAccent,
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
    if (widget.enable == true) {
      return haserror.either(
        is_true: Colors.redAccent,
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
