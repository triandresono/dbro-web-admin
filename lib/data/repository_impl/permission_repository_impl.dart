import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/datasource/permission_datasource.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/entity/permission/my_permission.dart';
import 'package:dbro_admin/domain/entity/permission/permission_list.dart';
import 'package:dbro_admin/domain/repository/permission_repository.dart';

class PermissionRepositoryImpl extends PermissionRepository {
  final PermissionDatasource datasource;
  PermissionRepositoryImpl(this.datasource);

  @override
  Future<Either<Status, MyPermission>> get my_permission async {
    try {
      final result = await datasource.my_permission;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(MyPermission.fromMap(result.toMap())),
      );
    } catch (e) {
      if (e is Map) {
        return Left(Status.failure(e as Map<String, dynamic>));
      } else {
        return Left(Status(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Status, GetId>> permission_create(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await datasource.permission_create(body);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(GetId.fromMap(result.toMap())),
      );
    } catch (e) {
      if (e is Map) {
        return Left(Status.failure(e as Map<String, dynamic>));
      } else {
        return Left(Status(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Status, GetId>> permission_delete(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await datasource.permission_delete(body);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(GetId.fromMap(result.toMap())),
      );
    } catch (e) {
      if (e is Map) {
        return Left(Status.failure(e as Map<String, dynamic>));
      } else {
        return Left(Status(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Status, PermissionList>> permission_list(
    Map<String, dynamic> map,
  ) async {
    try {
      final result = await datasource.permission_list(map);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(PermissionList.fromMap(result.toMap())),
      );
    } catch (e) {
      if (e is Map) {
        return Left(Status.failure(e as Map<String, dynamic>));
      } else {
        return Left(Status(message: e.toString()));
      }
    }
  }
}
