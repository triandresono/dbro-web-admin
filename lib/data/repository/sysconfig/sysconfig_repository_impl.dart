import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/datasource/sysconfig_datasource.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_list.dart';
import 'package:dbro_admin/data/repository/sysconfig/sysconfig_repository.dart';

class SysconfigRepositoryImpl extends SysconfigRepository {
  final SysconfigDatasource datasource;
  SysconfigRepositoryImpl(this.datasource);

  @override
  Future<Either<StatusResponse, SysconfigList>> sysconfig_list(
    Map<String, dynamic> map,
  ) async {
    try {
      final result = await datasource.sysconfig_list(map);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(SysconfigList.fromMap(result.toMap())),
      );
    } catch (e) {
      if (e is Map) {
        return Left(StatusResponse.failure(e as Map<String, dynamic>));
      } else {
        return Left(StatusResponse(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<StatusResponse, GetId>> create(
      Map<String, dynamic> body) async {
    try {
      final result = await datasource.create(body);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(GetId.fromMap(result.toMap())),
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
