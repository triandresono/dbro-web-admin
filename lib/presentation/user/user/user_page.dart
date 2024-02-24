import 'package:auto_route/auto_route.dart';
import 'package:dbro_admin/presentation/error/coming_soon/coming_soon_page.dart';
import 'package:dbro_admin/presentation/rail/rail_worker.dart';
import 'package:dbro_admin/ui_kit/colors.dart';
import 'package:dbro_admin/ui_kit/widgets/base_appbar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserPage extends StatelessWidget {
  static const path = 'user';
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: RailDrawer(),
      appBar: const BaseAppbar(title: "User"),
      backgroundColor: AppColor.appGrayBg,
      body: const ComingSoonPage(),
    );
  }
}
