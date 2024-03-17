import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:dbro_admin/ui_kit/widgets/base_button_icon.dart';
import 'package:dbro_admin/utils/constants/enumeration.dart';
import 'package:flutter/material.dart';

class DialogErrorState extends StatelessWidget {
  final StatusResponse status;
  final VoidCallback onReload;
  const DialogErrorState({
    super.key,
    required this.status,
    required this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              status.message,
              textAlign: TextAlign.center,
              style: Font.fix(16).regular(
                color: AppColor.headerTile,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BaseButtonIcon(
                colorType: ColorType.WHITE,
                title: "Cancel",
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(width: 12),
              BaseButtonIcon(
                title: "Reload",
                onPressed: () => onReload.call(),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
