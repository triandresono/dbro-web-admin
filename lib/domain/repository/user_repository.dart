import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/auth/login.dart';
import 'package:dbro_admin/domain/entity/user/user_dropdown.dart';

abstract class UserRepository {
  Future<Either<Status, Login>> login(Map<String, dynamic> body);

  Future<Either<Status, Status>> get logout;

  Future<Either<Status, UserDropdown>> get userDropdown;
}
