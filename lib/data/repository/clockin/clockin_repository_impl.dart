import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/datasource/clockin_datasource.dart';
import 'package:dbro_admin/data/repository/clockin/clockin_repository.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/clockin/clockin_user_list.dart';

class ClockinRepositoryImpl extends ClockinRepository {
  final ClockinDatasource datasource;
  ClockinRepositoryImpl(this.datasource);

  @override
  Future<Either<StatusResponse, ClockInUserList>> userList(String id) async {
    try {
      final result = await datasource.userList(id);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(ClockInUserList.fromMap(result.toMap())),
      );
    } catch (e) {
      if (e is Map) {
        return Left(StatusResponse.failure(e as Map<String, dynamic>));
      } else {
        return Left(StatusResponse(message: e.toString()));
      }
    }
  }
}
