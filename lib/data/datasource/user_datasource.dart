import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/any/get_id_response.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/data/response/auth/login_response.dart';
import 'package:dbro_admin/data/response/user/user_all_response.dart';
import 'package:dbro_admin/data/response/user/user_attendance_response.dart';
import 'package:dbro_admin/data/response/user/user_dropdown_response.dart';
import 'package:dbro_admin/network/api/api.dart';
import 'package:dbro_admin/network/http_util/http_util.dart';

class UserDatasource {
  final HttpUtil http;
  UserDatasource(this.http);

  Future<Either<StatusResponse, LoginResponse>> login(
      Map<String, dynamic> body) async {
    try {
      final result = await http.post(
        uri: Api.user.login,
        body: body,
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(LoginResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<StatusResponse, StatusResponse>> get logout async {
    try {
      final result = await http.post(uri: Api.user.logout);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(StatusResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<StatusResponse, UserDropdownResponse>> get userDropdown async {
    try {
      final result = await http.get(
        uri: Api.user.dropdown,
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(UserDropdownResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<StatusResponse, UserAllResponse>> userAll(
    Map<String, dynamic> parameter,
  ) async {
    try {
      final result = await http.get(
        uri: Api.user.all,
        parameter: parameter,
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(UserAllResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<StatusResponse, StatusResponse>> register(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await http.post(
        uri: Api.user.register,
        body: body,
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(StatusResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<StatusResponse, StatusResponse>> registerVerify(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await http.post(
        uri: Api.user.verify,
        body: body,
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(StatusResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<StatusResponse, GetIdResponse>> updatePayroll(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await http.post(
        uri: Api.user.updatePayroll,
        body: body,
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(GetIdResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<StatusResponse, UserAttendanceResponse>>
      get userAttendance async {
    try {
      final result = await http.get(
        uri: Api.user.attendance,
      );

      return result.fold(
        (failure) => Left(failure),
        (result) => Right(UserAttendanceResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }
}
