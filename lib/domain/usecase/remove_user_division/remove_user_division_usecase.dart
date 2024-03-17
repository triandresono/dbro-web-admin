import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';

abstract class RemoveUserDivisionUsecase {
  Future<Either<StatusResponse, StatusResponse>> removeUserDivision(
    Map<String, dynamic> body,
  );
}
