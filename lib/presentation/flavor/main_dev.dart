import 'package:dbro_admin/app_dependencies.dart';
import 'package:dbro_admin/core/constants/consts.dart';
import 'package:dbro_admin/core/flavor/flavor.dart';
import 'package:dbro_admin/core/logger/dev_tree.dart';
import 'package:dbro_admin/presentation/initial/dbro_initial.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flavor(variables: {Consts.base_key: Consts.base_uri.base});
  AppDependencies(await SharedPreferences.getInstance().then((v) => v));
  Fimber.plantTree(DevTree());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const DbroInitial());
}
