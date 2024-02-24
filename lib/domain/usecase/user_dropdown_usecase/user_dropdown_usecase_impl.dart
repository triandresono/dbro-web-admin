import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/user/user_dropdown.dart';
import 'package:dbro_admin/data/repository/user/user_repository.dart';
import 'package:dbro_admin/domain/usecase/user_dropdown_usecase/user_dropdown_usecase.dart';

class UserDropdownUsecaseImpl extends UserDropdownUsecase {
  final UserRepository repository;
  UserDropdownUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, UserDropdown>> get userDropdown {
    return repository.userDropdown;
  }
}
