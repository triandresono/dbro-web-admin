import 'package:dbro_admin/core/core_dependencies.dart';
import 'package:dbro_admin/data/data_dependencies.dart';
import 'package:dbro_admin/domain/domain_dependencies.dart';
import 'package:dbro_admin/presentation/register_presentation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDependencies {
  AppDependencies(SharedPreferences pref) {
    CoreDependencies(pref);
    DataDependencies();
    DomainDependencies();
    RegisterPresentation();
  }
}
