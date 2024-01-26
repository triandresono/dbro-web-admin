import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/datasource/division_datasource.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/entity/division/division_dropdown.dart';
import 'package:dbro_admin/domain/entity/division/division_list.dart';
import 'package:dbro_admin/domain/repository/division_repository.dart';

class DivisionRepositoryImpl extends DivisionRepository {
  final DivisionDatasource datasource;
  DivisionRepositoryImpl(this.datasource);

  @override
  Future<Either<Status, DivisionList>> childList(String id) async {
    try {
      final result = await datasource.childList(id);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(DivisionList.fromMap(result.toMap())),
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
  Future<Either<Status, DivisionList>> get rootList async {
    try {
      final result = await datasource.rootList;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(DivisionList.fromMap(result.toMap())),
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
  Future<Either<Status, GetId>> createDivision(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await datasource.createDivision(body);
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
  Future<Either<Status, DivisionDropdown>> get dropdown async {
    try {
      final result = await datasource.dropdown;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(DivisionDropdown.fromMap(result.toMap())),
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
  Future<Either<Status, GetId>> createDivisionStructure(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await datasource.createDivisionStructure(body);
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
}
