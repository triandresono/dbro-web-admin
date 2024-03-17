import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:flutter/material.dart';

class CommonFlexChildren extends StatelessWidget {
  final List<Widget> children;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  const CommonFlexChildren({
    Key? key,
    required this.children,
    this.mainAxisSize = MainAxisSize.min,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: context.isdesktopOrTab ? Axis.horizontal : Axis.vertical,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    );
  }
}

class CommonFlexBox extends StatelessWidget {
  final double size;
  const CommonFlexBox({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.isdesktopOrTab
        ? SizedBox(width: size)
        : SizedBox(height: size);
  }
}

class CommonFleWidth extends StatelessWidget {
  final double size;
  const CommonFleWidth({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.isdesktopOrTab
        ? SizedBox(width: size)
        : const SizedBox(height: 0);
  }
}

class CommonFlex extends StatelessWidget {
  final Widget child;
  final int flex;
  const CommonFlex({
    Key? key,
    required this.child,
    this.flex = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.isdesktopOrTab) {
      return Expanded(
        flex: flex,
        child: child,
      );
    } else {
      return child;
    }
  }
}

class FlexInverse extends StatelessWidget {
  final Widget child;
  const FlexInverse({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.ismobile) {
      return Expanded(
        child: child,
      );
    } else {
      return child;
    }
  }
}
