import 'package:dbro_admin/core/route/app_router.dart';
import 'package:dbro_admin/data/data_dependencies.dart';
import 'package:dbro_admin/domain/domain_dependencies.dart';
import 'package:dbro_admin/network/http_util/http_util.dart';
import 'package:dbro_admin/network/http_util/http_util_impl.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoreDependencies {
  CoreDependencies(SharedPreferences pref) {
    Get.put(pref);
    RegisterLocalData();
    RegisterLocalDomain();
    Get.perm(AppRouter());
    Get.perm<HttpUtil>(HttpUtilImpl(Get.find()));
  }
}
