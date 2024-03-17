import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/clockin/clockin_user_list.dart';

abstract class ClockinRepository {
  Future<Either<StatusResponse, ClockInUserList>> userList(
    String id,
  );
}
