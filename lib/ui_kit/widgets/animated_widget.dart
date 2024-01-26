import 'package:dbro_admin/ui_kit/widgets/animated_size.dart';
import 'package:dbro_admin/ui_kit/widgets/blank_builder.dart';
import 'package:flutter/material.dart';

class SwitcherBuilder extends StatelessWidget {
  final Widget Function() builder;
  final Duration fadeDuration;
  final Duration sizeDuration;
  const SwitcherBuilder({
    super.key,
    required this.builder,
    this.fadeDuration = const Duration(milliseconds: 500),
    this.sizeDuration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcherSize(
      fadeDuration: (this).fadeDuration,
      sizeDuration: (this).sizeDuration,
      child: (this).builder(),
    );
  }
}

class SwitcherWidget extends StatelessWidget {
  final Widget child;
  final Duration fadeDuration;
  final Duration sizeDuration;
  const SwitcherWidget({
    super.key,
    required this.child,
    this.fadeDuration = const Duration(milliseconds: 500),
    this.sizeDuration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcherSize(
      fadeDuration: (this).fadeDuration,
      sizeDuration: (this).sizeDuration,
      child: (this).child,
    );
  }
}

class AnimatedVisibiity extends StatelessWidget {
  final Widget child;
  final bool show;
  final Duration fadeDuration;
  final Duration sizeDuration;
  const AnimatedVisibiity({
    super.key,
    required this.child,
    this.show = true,
    this.fadeDuration = const Duration(milliseconds: 200),
    this.sizeDuration = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcherSize(
      fadeDuration: (this).fadeDuration,
      sizeDuration: (this).sizeDuration,
      fadeInCurve: Curves.bounceInOut,
      fadeOutCurve: Curves.bounceInOut,
      sizeCurve: Curves.bounceInOut,
      child: BlankBuilder(() {
        if (show == true) {
          return (this).child;
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
