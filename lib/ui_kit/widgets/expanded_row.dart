import 'package:flutter/material.dart';

class ExpandedRow extends StatelessWidget {
  final Widget child;
  const ExpandedRow({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(children: [Expanded(child: child)]);
  }
}
