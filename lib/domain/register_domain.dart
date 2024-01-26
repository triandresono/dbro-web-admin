import 'package:dbro_admin/domain/usecase/division_child_usecase/division_child_usecase.dart';
import 'package:dbro_admin/domain/usecase/division_child_usecase/division_child_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/division_create_relation_usecase/division_create_relation_usecase.dart';
import 'package:dbro_admin/domain/usecase/division_create_relation_usecase/division_create_relation_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/division_create_usecase/division_create_usecase.dart';
import 'package:dbro_admin/domain/usecase/division_create_usecase/division_create_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/division_dropdown_usecase/division_dropdown_usecase.dart';
import 'package:dbro_admin/domain/usecase/division_dropdown_usecase/division_dropdown_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/division_root_usecase/division_root_usecase.dart';
import 'package:dbro_admin/domain/usecase/division_root_usecase/division_root_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/local_usecase/local_usecase.dart';
import 'package:dbro_admin/domain/usecase/login_usecase/login_usecase.dart';
import 'package:dbro_admin/domain/usecase/logout_usecase/logout_usecase.dart';
import 'package:dbro_admin/domain/usecase/my_permission_usecase/my_permission_usecase.dart';
import 'package:dbro_admin/domain/usecase/permission_create_usecase/permission_create_usecase.dart';
import 'package:dbro_admin/domain/usecase/permission_delete_usecase/permission_delete_usecase.dart';
import 'package:dbro_admin/domain/usecase/permission_list_usecase/permission_list_usecase.dart';
import 'package:dbro_admin/domain/usecase/local_usecase/local_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/login_usecase/login_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/logout_usecase/logout_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/my_permission_usecase/my_permission_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/permission_create_usecase/permission_create_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/permission_delete_usecase/permission_delete_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/permission_list_usecase/permission_list_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/sysconfig_list_usecase/sysconfig_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/sysconfig_list_usecase/sysconfog_list_usecase.dart';
import 'package:dbro_admin/domain/usecase/user_dropdown_usecase/user_dropdown_usecase.dart';
import 'package:dbro_admin/domain/usecase/user_dropdown_usecase/user_dropdown_usecase_impl.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:get/get.dart';
import 'usecase/sysconfig_create_usecase/sysconfif_create_usecase_impl.dart';
import 'usecase/sysconfig_create_usecase/sysconfig_create_usecase.dart';
import 'usecase/sysconfig_type_detail_usecase/sysconfig_type_detail_usecase.dart';
import 'usecase/sysconfig_type_detail_usecase/sysconfig_type_detail_usecase_impl.dart';
import 'usecase/sysconfig_type_list_usecase/sysconfig_type_list_usecase.dart';
import 'usecase/sysconfig_type_list_usecase/sysconfig_type_list_usecase_impl.dart';

class RegisterDomain {
  RegisterDomain() {
    Get.lazy<LoginUsecase>(LoginUsecaseImpl(Get.find()));
    Get.lazy<LogoutUsecase>(LogoutUsecaseImpl(Get.find()));

    Get.lazy<SysconfigListUsecase>(SysconfigListUsecaseImpl(Get.find()));
    Get.lazy<SysconfigCreateUsecase>(SysconfigCreateUsecaseImpl(Get.find()));

    Get.lazy<SysconfigTypeDetailUsecase>(
      SysconfigTypeDetailUsecaseImpl(Get.find()),
    );
    Get.lazy<SysconfigTypeListUsecase>(
      SysconfigTypeListUsecaseImpl(Get.find()),
    );

    Get.lazy<MyPermissionUsecase>(MyPermissionUsecaseImpl(Get.find()));
    Get.lazy<PermissionListUsecase>(PermissionListUsecaseImpl(Get.find()));
    Get.lazy<PermissionCreateUsecase>(PermissionCreateUsecaseImpl(Get.find()));
    Get.lazy<PermissionDeleteUsecase>(PermissionDeleteUsecaseImpl(Get.find()));
    Get.lazy<DivisionRootUsecase>(DivisionRootUsecaseImpl(Get.find()));
    Get.lazy<DivisionChildUsecase>(DivisionChildUsecaseImpl(Get.find()));
    Get.lazy<DivisionCreateUsecase>(DivisionCreateUsecaseImpl(Get.find()));
    Get.lazy<DivisionDropdownUsecase>(DivisionDropdownUsecaseImpl(Get.find()));
    Get.lazy<UserDropdownUsecase>(UserDropdownUsecaseImpl(Get.find()));
    Get.lazy<DivisionCreateRelationUsecase>(
      DivisionCreateRelationUsecaseImpl(Get.find()),
    );
  }
}

class RegisterLocalDomain {
  RegisterLocalDomain() {
    Get.lazy<LocalUsecase>(LocalUsecaseImpl(Get.find()));
  }
}
