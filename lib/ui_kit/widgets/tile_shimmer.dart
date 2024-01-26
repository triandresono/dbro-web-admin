import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TileShimmer extends StatelessWidget {
  final int count;
  const TileShimmer({super.key, this.count = 3});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18).copyWith(bottom: 18),
      child: Column(
        children: List.generate(count, (index) {
          return SizedBox(
            height: 50,
            width: double.infinity,
            child: Shimmer.fromColors(
              period: const Duration(milliseconds: 1500),
              baseColor: AppColor.greyField.withOpacity(0.8),
              highlightColor: Colors.grey.shade100,
              child: const Card(
                color: Colors.black,
                child: SizedBox(
                  width: double.infinity,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
