import 'package:dbro_admin/domain/usecase/add_user_division/add_user_division_usecase.dart';
import 'package:dbro_admin/domain/usecase/add_user_division/add_user_division_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/all_user/all_user_usecase.dart';
import 'package:dbro_admin/domain/usecase/all_user/all_user_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/clockin_userlist/clockin_userlist_usecase.dart';
import 'package:dbro_admin/domain/usecase/clockin_userlist/clockin_userlist_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/division_child/division_child_usecase.dart';
import 'package:dbro_admin/domain/usecase/division_child/division_child_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/division_create_relation/division_create_relation_usecase.dart';
import 'package:dbro_admin/domain/usecase/division_create_relation/division_create_relation_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/division_create/division_create_usecase.dart';
import 'package:dbro_admin/domain/usecase/division_create/division_create_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/division_dropdown/division_dropdown_usecase.dart';
import 'package:dbro_admin/domain/usecase/division_dropdown/division_dropdown_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/division_root/division_root_usecase.dart';
import 'package:dbro_admin/domain/usecase/division_root/division_root_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/division_update_payroll/division_update_payroll_usecase.dart';
import 'package:dbro_admin/domain/usecase/division_update_payroll/division_update_payroll_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/local/local_usecase.dart';
import 'package:dbro_admin/domain/usecase/login/login_usecase.dart';
import 'package:dbro_admin/domain/usecase/logout/logout_usecase.dart';
import 'package:dbro_admin/domain/usecase/my_permission/my_permission_usecase.dart';
import 'package:dbro_admin/domain/usecase/outlet_list/outlet_list_usecase.dart';
import 'package:dbro_admin/domain/usecase/outlet_list/outlet_list_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/payroll_user/payroll_user_usecase.dart';
import 'package:dbro_admin/domain/usecase/payroll_user/payroll_user_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/permission_create/permission_create_usecase.dart';
import 'package:dbro_admin/domain/usecase/permission_delete/permission_delete_usecase.dart';
import 'package:dbro_admin/domain/usecase/permission_list/permission_list_usecase.dart';
import 'package:dbro_admin/domain/usecase/local/local_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/login/login_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/logout/logout_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/my_permission/my_permission_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/permission_create/permission_create_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/permission_delete/permission_delete_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/permission_list/permission_list_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/register_user/register_user_usecase.dart';
import 'package:dbro_admin/domain/usecase/register_user/register_user_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/register_verify/register_verify_usecase.dart';
import 'package:dbro_admin/domain/usecase/register_verify/register_verify_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/remove_user_division/remove_user_division_usecase.dart';
import 'package:dbro_admin/domain/usecase/remove_user_division/remove_user_division_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/role_dropdown/role_dropdown_usecase.dart';
import 'package:dbro_admin/domain/usecase/role_dropdown/role_dropdown_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/sysconfig_list/sysconfig_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/sysconfig_list/sysconfog_list_usecase.dart';
import 'package:dbro_admin/domain/usecase/user_attendance/user_attendance_usecase.dart';
import 'package:dbro_admin/domain/usecase/user_attendance/user_attendance_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/user_division/user_division_usecase.dart';
import 'package:dbro_admin/domain/usecase/user_division/user_division_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/user_dropdown/user_dropdown_usecase.dart';
import 'package:dbro_admin/domain/usecase/user_dropdown/user_dropdown_usecase_impl.dart';
import 'package:dbro_admin/domain/usecase/user_update_payroll/user_update_payroll_usecase.dart';
import 'package:dbro_admin/domain/usecase/user_update_payroll/user_update_payroll_usecase_impl.dart';
import 'package:dbro_admin/utils/app_extension/extension.dart';
import 'package:get/get.dart';
import 'usecase/sysconfig_create/sysconfif_create_usecase_impl.dart';
import 'usecase/sysconfig_create/sysconfig_create_usecase.dart';
import 'usecase/sysconfig_type_detail/sysconfig_type_detail_usecase.dart';
import 'usecase/sysconfig_type_detail/sysconfig_type_detail_usecase_impl.dart';
import 'usecase/sysconfig_type_list/sysconfig_type_list_usecase.dart';
import 'usecase/sysconfig_type_list/sysconfig_type_list_usecase_impl.dart';

class DomainDependencies {
  DomainDependencies() {
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
    Get.lazy<UserDivisionUsecase>(UserDivisionUsecaseImpl(Get.find()));
    Get.lazy<AllUserUsecase>(AllUserUsecaseImpl(Get.find()));
    Get.lazy<AddUserDivisionUsecase>(AddUserDivisionUsecaseImpl(Get.find()));
    Get.lazy<RegisterUserUsecase>(RegisterUserUsecaseImpl(Get.find()));
    Get.lazy<RegisterVerifyUsecase>(RegisterVerifyUsecaseImpl(Get.find()));
    Get.lazy<OutletListUsecase>(OutletListUsecaseImpl(Get.find()));
    Get.lazy<PayrollUserUsecase>(PayrollUserUsecaseImpl(Get.find()));
    Get.lazy<RoleDropdownUsecase>(RoleDropdownUsecaseImpl(Get.find()));
    Get.lazy<ClockinUserlistUsecase>(ClockinUserlistUsecaseImpl(Get.find()));
    Get.lazy<UserAttendanceUsecase>(UserAttendanceUsecaseImpl(Get.find()));

    Get.lazy<UserUpdatePayrollUsecase>(
      UserUpdatePayrollUsecaseImpl(Get.find()),
    );

    Get.lazy<DivisionUpdatePayrollUsecase>(
      DivisionUpdatePayrollUsecaseImpl(Get.find()),
    );
    Get.lazy<RemoveUserDivisionUsecase>(
      RemoveUserDivisionUsecaseImpl(Get.find()),
    );
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
