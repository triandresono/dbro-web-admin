part of '../add_sysconfig_worker.dart';

class _Error extends StatelessWidget {
  final Status status;
  final VoidCallback onReload;
  const _Error({
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
