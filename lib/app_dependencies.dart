import 'package:dbro_admin/core/register_core.dart';
import 'package:dbro_admin/data/register_data.dart';
import 'package:dbro_admin/domain/register_domain.dart';
import 'package:dbro_admin/presentation/register_presentation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDependencies {
  AppDependencies(SharedPreferences pref) {
    RegisterCore(pref);
    RegisterData();
    RegisterDomain();
    RegisterPresentation();
  }
}
