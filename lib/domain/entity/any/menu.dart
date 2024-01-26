import 'package:auto_route/auto_route.dart';
import 'package:dbro_admin/core/route/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu {
  String menuKey;
  String menuCode;
  String menuName;
  List<Menu> menus;

  //HELPER
  IconData icon;
  PageRouteInfo<dynamic> route;
  RxBool selected = false.obs;
  RxBool expanded = false.obs;

  Menu({
    this.menuCode = '',
    this.menuKey = '',
    this.menuName = '',
    this.route = const SplashRoute(),
    this.menus = const [],
    this.icon = Icons.close,
  });

  factory Menu.fromMap(Map<String, dynamic> map) {
    return Menu(
      menuCode: map['menuCode'] as String,
      menuName: map['menuName'] as String,
      menus: map['menus'] != null
          ? List<Menu>.from(
              (map['menus'] as List).map<Menu>(
                (x) => Menu.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }
}
