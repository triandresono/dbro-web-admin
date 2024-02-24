import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/datasource/user_datasource.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/auth/login.dart';
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
}
