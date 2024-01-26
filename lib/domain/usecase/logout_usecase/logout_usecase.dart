import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';

abstract class LogoutUsecase {
  Future<Either<Status, Status>> get logout;
}
