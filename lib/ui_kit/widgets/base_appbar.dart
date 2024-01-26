import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/domain/usecase/local_usecase/local_usecase.dart';
import 'package:dbro_admin/presentation/pages/logout/logout_worker.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/entity/bar.dart';
import 'package:dbro_admin/ui_kit/widgets/animated_widget.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:dbro_admin/ui_kit/font/font_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BaseAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Bar> menu;
  const BaseAppbar({
    super.key,
    required this.title,
    this.menu = const [],
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Row(
          children: [
            AnimatedVisibiity(
              show: context.deviceType != DeviceScreenType.desktop,
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      IconlyLight.category,
                      color: AppColor.headerTile,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              title,
              style: Font.fix(20).semiBold(
                color: AppColor.headerTile,
              ),
            ),
            Visibility(
              visible: menu.isNotEmpty &&
                  context.deviceType != DeviceScreenType.mobile,
              child: Row(
                children: [
                  Container(
                    height: preferredSize.height,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: const VerticalDivider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: AppColor.projectGray,
                    ),
                  ),
                  Row(
                    children: menu.map((element) {
                      final index = menu.indexOf(element);
                      return _BarList(
                        bar: element,
                        visible: menu.length > 1 && (index + 1) != menu.length,
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            const Spacer(),
            PopupMenuButton(
              offset: const Offset(-25, 25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadowColor: Colors.grey.withOpacity(0.5),
              padding: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    Text(
                      Get.find<LocalUsecase>().get_user.email,
                      style: Font.fix(12.5).regular(
                        color: AppColor.headerTile,
                      ),
                    ),
                    const SizedBox(width: 2),
                    const Icon(
                      IconlyLight.arrow_down_2,
                      color: AppColor.mainOrange,
                      size: 16.5,
                    ),
                  ],
                ),
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    height: 30,
                    onTap: () {
                      AppRouter.nav.dialog(dialog: const LogoutDialog());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Logout',
                          style: Font.fix(13).regular(
                            color: AppColor.headerTile,
                          ),
                        ),
                        const Icon(
                          Icons.power_settings_new_rounded,
                          color: AppColor.mainOrange,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ];
              },
            )
          ],
        ),
      ),
    );
  }
}

class _BarList extends StatelessWidget {
  final Bar bar;
  final bool visible;
  const _BarList({
    Key? key,
    required this.bar,
    this.visible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: bar.onTap != null ? () => bar.onTap?.call() : null,
          child: Text(
            bar.title!,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: bar.color,
              fontSize: 12,
            ),
          ),
        ),
        Visibility(
          visible: visible,
          child: const Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Icon(
              IconlyLight.arrow_right_2,
              size: 10,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
