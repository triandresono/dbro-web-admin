import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/user/user_all.dart';

abstract class AllUserUsecase {
  Future<Either<StatusResponse, UserAll>> userAll(
    Map<String, dynamic> parameter,
  );
}
