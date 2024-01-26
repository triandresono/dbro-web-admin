import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CommonShimmer extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  const CommonShimmer({
    Key? key,
    required this.child,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: (isLoading)
          ? Shimmer.fromColors(
              key: const ValueKey('1'),
              period: const Duration(milliseconds: 1500),
              baseColor: AppColor.greyField.withOpacity(0.8),
              highlightColor: Colors.grey.shade100,
              child: IgnorePointer(
                ignoring: isLoading,
                child: child,
              ),
            )
          : child,
    );
  }
}
