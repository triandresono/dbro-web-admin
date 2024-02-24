import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/datasource/sysconfig_type_datasource.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_detail.dart';
import 'package:dbro_admin/domain/entity/sysconfig/sysconfig_type_list.dart';
import 'package:dbro_admin/data/repository/sysconfig_type/sysconfig_type_repository.dart';

class SysconfigTypeRepositoryImpl extends SysconfigTypeRepository {
  final SysconfigTypeDatasource datasource;
  SysconfigTypeRepositoryImpl(this.datasource);

  @override
  Future<Either<StatusResponse, SysconfigDetail>> getDetail(String name) async {
    try {
      final result = await datasource.getDetail(name);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(SysconfigDetail.fromMap(result.toMap())),
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
  Future<Either<StatusResponse, SysconfigTypeList>> get list async {
    try {
      final result = await datasource.list;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(SysconfigTypeList.fromMap(result.toMap())),
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
