import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/datasource/division_datasource.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/entity/division/division_dropdown.dart';
import 'package:dbro_admin/domain/entity/division/division_list.dart';
import 'package:dbro_admin/domain/entity/division/outlet_payroll_list.dart';
import 'package:dbro_admin/domain/entity/division/user_division.dart';
import 'package:dbro_admin/data/repository/division/division_repository.dart';

class DivisionRepositoryImpl extends DivisionRepository {
  final DivisionDatasource datasource;
  DivisionRepositoryImpl(this.datasource);

  @override
  Future<Either<StatusResponse, DivisionList>> childList(String id) async {
    try {
      final result = await datasource.childList(id);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(DivisionList.fromMap(result.toMap())),
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
  Future<Either<StatusResponse, DivisionList>> get rootList async {
    try {
      final result = await datasource.rootList;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(DivisionList.fromMap(result.toMap())),
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
  Future<Either<StatusResponse, GetId>> createDivision(
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
        return Left(StatusResponse.failure(e as Map<String, dynamic>));
      } else {
        return Left(StatusResponse(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<StatusResponse, DivisionDropdown>> get dropdown async {
    try {
      final result = await datasource.dropdown;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(DivisionDropdown.fromMap(result.toMap())),
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
  Future<Either<StatusResponse, GetId>> createDivisionStructure(
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
        return Left(StatusResponse.failure(e as Map<String, dynamic>));
      } else {
        return Left(StatusResponse(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<StatusResponse, UserDivision>> userDivision(String id) async {
    try {
      final result = await datasource.userDivision(id);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(UserDivision.fromMap(result.toMap())),
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
  Future<Either<StatusResponse, GetId>> addUserDivision(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await datasource.addUserDivision(body);
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

  @override
  Future<Either<StatusResponse, StatusResponse>> removeUserDivision(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await datasource.removeUserDivision(body);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(result),
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
  Future<Either<StatusResponse, OutletPayrollList>> get outletList async {
    try {
      final result = await datasource.outletList;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(OutletPayrollList.fromMap(result.toMap())),
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
  Future<Either<StatusResponse, StatusResponse>> updateDivisionPayroll(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await datasource.updateDivisionPayroll(body);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(result),
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
