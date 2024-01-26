import 'package:dbro_admin/ui_kit/widgets/tile_shimmer.dart';
import 'package:flutter/material.dart';

class TableShimmer {
  static List<DataRow> shimmer1([int count = 3]) {
    return List.generate(count, (index) {
      return const DataRow(cells: [
        DataCell(
          TileShimmer(count: 0),
        ),
      ]);
    });
  }
}
