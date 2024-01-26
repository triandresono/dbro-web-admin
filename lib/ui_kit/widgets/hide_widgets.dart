import 'package:dbro_admin/ui_kit/widgets/animated_widget.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OnlyDesktop extends StatelessWidget {
  final Widget child;
  const OnlyDesktop({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SwitcherBuilder(
      fadeDuration: const Duration(milliseconds: 200),
      sizeDuration: const Duration(milliseconds: 200),
      builder: () {
        if (context.deviceType == DeviceScreenType.desktop) {
          return child;
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class DesktopAndTablet extends StatelessWidget {
  final Widget child;
  const DesktopAndTablet({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SwitcherBuilder(
      fadeDuration: const Duration(milliseconds: 200),
      sizeDuration: const Duration(milliseconds: 200),
      builder: () {
        if (context.deviceType == DeviceScreenType.desktop) {
          return child;
        } else if (context.deviceType == DeviceScreenType.tablet) {
          return child;
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
