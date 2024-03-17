import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/repository/clockin/clockin_repository.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/clockin/clockin_user_list.dart';
import 'package:dbro_admin/domain/usecase/clockin_userlist/clockin_userlist_usecase.dart';

class ClockinUserlistUsecaseImpl extends ClockinUserlistUsecase {
  final ClockinRepository repository;
  ClockinUserlistUsecaseImpl(this.repository);

  @override
  Future<Either<StatusResponse, ClockInUserList>> userList(String id) {
    return repository.userList(id);
  }
}
