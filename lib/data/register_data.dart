import 'package:dbro_admin/data/datasource/division_datasource.dart';
import 'package:dbro_admin/data/datasource/permission_datasource.dart';
import 'package:dbro_admin/data/datasource/sysconfig_datasource.dart';
import 'package:dbro_admin/data/datasource/sysconfig_type_datasource.dart';
import 'package:dbro_admin/data/datasource/user_datasource.dart';
import 'package:dbro_admin/data/datasource/local_datasource.dart';
import 'package:dbro_admin/data/repository/division/division_repository_impl.dart';
import 'package:dbro_admin/data/repository/local/local_repository_impl.dart';
import 'package:dbro_admin/data/repository/permission/permission_repository_impl.dart';
import 'package:dbro_admin/data/repository/sysconfig/sysconfig_repository_impl.dart';
import 'package:dbro_admin/data/repository/sysconfig_type/sysconfig_type_repository_impl.dart';
import 'package:dbro_admin/data/repository/user/user_repository_impl.dart';
import 'package:dbro_admin/data/repository/division/division_repository.dart';
import 'package:dbro_admin/data/repository/local/local_repository.dart';
import 'package:dbro_admin/data/repository/permission/permission_repository.dart';
import 'package:dbro_admin/data/repository/sysconfig/sysconfig_repository.dart';
import 'package:dbro_admin/data/repository/sysconfig_type/sysconfig_type_repository.dart';
import 'package:dbro_admin/data/repository/user/user_repository.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:get/get.dart';

class RegisterData {
  RegisterData() {
    Get.lazy(UserDatasource(Get.find()));
    Get.lazy(SysconfigDatasource(Get.find()));
    Get.lazy(SysconfigTypeDatasource(Get.find()));
    Get.lazy(PermissionDatasource(Get.find()));
    Get.lazy(DivisionDatasource(Get.find()));

    Get.lazy<UserRepository>(UserRepositoryImpl(Get.find()));
    Get.lazy<SysconfigRepository>(SysconfigRepositoryImpl(Get.find()));
    Get.lazy<SysconfigTypeRepository>(SysconfigTypeRepositoryImpl(Get.find()));
    Get.lazy<PermissionRepository>(PermissionRepositoryImpl(Get.find()));
    Get.lazy<PermissionRepository>(PermissionRepositoryImpl(Get.find()));
    Get.lazy<DivisionRepository>(DivisionRepositoryImpl(Get.find()));
  }
}

class RegisterLocalData {
  RegisterLocalData() {
    Get.lazy(LocalDatasource(Get.find()));
    Get.lazy<LocalRepository>(LocalRepositoryImpl(Get.find()));
  }
}
