part of '../rail_worker.dart';

class _ParentTile extends StatelessWidget {
  final List<Widget>? children;
  final Function(Menu) onTap;
  final Menu menu;
  final IconData icon;
  const _ParentTile({
    this.children,
    required this.menu,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: Column(
        children: [
          _Tile(
            onTap: (p0) => onTap.call(menu),
            icon: icon,
            menu: menu,
          ),
          if (menu.menus.isNotEmpty)
            Obx(() {
              var expanded = menu.expanded.value;
              return SwitcherBuilder(
                fadeDuration: const Duration(milliseconds: 200),
                sizeDuration: const Duration(milliseconds: 200),
                builder: () {
                  if (expanded) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Column(
                        children: children ?? [],
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
            }),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final Function(Menu) onTap;
  final Menu menu;
  final IconData icon;
  const _Tile({
    required this.menu,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return BlankBuilder(() {
      final hover = false.obs;
      return MouseRegion(
        onEnter: (_) => hover(true),
        onExit: (_) => hover(false),
        child: Obx(() {
          var cnd = hover.value || menu.expanded.value || menu.selected.value;
          var cnd2 = menu.selected.value;
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: ButtonTheme(
              child: TextButton(
                onPressed: () => onTap.call(menu),
                style: TextButton.styleFrom(
                  fixedSize: const Size.fromHeight(30),
                  backgroundColor: (cnd2)
                      ? AppColor.mainOrange.withOpacity(0.9)
                      : Colors.white,
                  elevation: (cnd) ? 2 : 0,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(88, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: (cnd) ? AppColor.mainOrange : Colors.white,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(children: [
                          Icon(
                            icon,
                            size: 17,
                            color: cnd2 ? Colors.white : AppColor.greyField,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              menu.menuName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Font.fix(14).medium(
                                color: cnd2 ? Colors.white : AppColor.greyField,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      (menu.menus.isEmpty).either(
                        is_true: const SizedBox(width: 10),
                        is_false: Icon(
                          (menu.expanded.value)
                              ? IconlyLight.arrow_up_2
                              : IconlyLight.arrow_down_2,
                          size: 15,
                          color: cnd2 ? Colors.white : AppColor.greyField,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
