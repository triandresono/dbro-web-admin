part of '../rail_worker.dart';

class _ChildTile extends StatelessWidget {
  final VoidCallback onTap;
  final Menu menu;
  const _ChildTile({
    required this.menu,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlankBuilder(() {
      final hover = false.obs;
      return MouseRegion(
        onEnter: (_) => hover(true),
        onExit: (_) => hover(false),
        child: Obx(() {
          var cnd = hover.value || menu.selected.value;
          return ButtonTheme(
            child: TextButton(
              onPressed: () => onTap.call(),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                minimumSize: const Size(88, 44),
                backgroundColor: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: Row(children: [
                  Icon(
                    menu.icon,
                    size: 20,
                    color: cnd ? Colors.black : AppColor.greyField,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      menu.menuName,
                      maxLines: 1,
                      style: cnd
                          ? Font.fix(14).regular(
                              color: cnd ? Colors.black : AppColor.greyField,
                            )
                          : Font.fix(14).semiBold(
                              color: cnd ? Colors.black : AppColor.greyField,
                            ),
                    ),
                  ),
                ]),
              ),
            ),
          );
        }),
      );
    });
  }
}
