import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/datasource/user_datasource.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/entity/auth/login.dart';
import 'package:dbro_admin/domain/entity/user/user_all.dart';
import 'package:dbro_admin/domain/entity/user/user_attendance.dart';
import 'package:dbro_admin/domain/entity/user/user_dropdown.dart';
import 'package:dbro_admin/data/repository/user/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDatasource datasource;
  UserRepositoryImpl(this.datasource);

  @override
  Future<Either<StatusResponse, Login>> login(Map<String, dynamic> body) async {
    try {
      final result = await datasource.login(body);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(Login.fromMap(result.toMap())),
      );
    } catch (e) {
      if (e is Map) {
        return Left(StatusResponse.fromMap(e as Map<String, dynamic>));
      } else {
        return Left(StatusResponse(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<StatusResponse, StatusResponse>> get logout async {
    try {
      final result = await datasource.logout;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(result),
      );
    } catch (e) {
      if (e is Map) {
        return Left(StatusResponse.fromMap(e as Map<String, dynamic>));
      } else {
        return Left(StatusResponse(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<StatusResponse, UserDropdown>> get userDropdown async {
    try {
      final result = await datasource.userDropdown;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(UserDropdown.fromMap(result.toMap())),
      );
    } catch (e) {
      if (e is Map) {
        return Left(StatusResponse.fromMap(e as Map<String, dynamic>));
      } else {
        return Left(StatusResponse(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<StatusResponse, UserAll>> userAll(
    Map<String, dynamic> parameter,
  ) async {
    try {
      final result = await datasource.userAll(parameter);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(UserAll.fromMap(result.toMap())),
      );
    } catch (e) {
      if (e is Map) {
        return Left(StatusResponse.fromMap(e as Map<String, dynamic>));
      } else {
        return Left(StatusResponse(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<StatusResponse, StatusResponse>> register(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await datasource.register(body);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(result),
      );
    } catch (e) {
      if (e is Map) {
        return Left(StatusResponse.fromMap(e as Map<String, dynamic>));
      } else {
        return Left(StatusResponse(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<StatusResponse, StatusResponse>> registerVerify(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await datasource.registerVerify(body);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(result),
      );
    } catch (e) {
      if (e is Map) {
        return Left(StatusResponse.fromMap(e as Map<String, dynamic>));
      } else {
        return Left(StatusResponse(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<StatusResponse, GetId>> updatePayroll(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await datasource.updatePayroll(body);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(GetId.fromMap(result.toMap())),
      );
    } catch (e) {
      if (e is Map) {
        return Left(StatusResponse.fromMap(e as Map<String, dynamic>));
      } else {
        return Left(StatusResponse(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<StatusResponse, UserAttendance>> get userAttendance async {
    try {
      final result = await datasource.userAttendance;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(UserAttendance.fromMap(result.toMap())),
      );
    } catch (e) {
      if (e is Map) {
        return Left(StatusResponse.fromMap(e as Map<String, dynamic>));
      } else {
        return Left(StatusResponse(message: e.toString()));
      }
    }
  }
}
