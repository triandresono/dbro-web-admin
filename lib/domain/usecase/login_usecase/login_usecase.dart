import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/auth/login.dart';

abstract class LoginUsecase {
  Future<Either<Status, Login>> login(Map<String, dynamic> body);
}
