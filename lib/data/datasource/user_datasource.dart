import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/data/response/auth/login_response.dart';
import 'package:dbro_admin/data/response/user/user_dropdown_response.dart';
import 'package:dbro_admin/network/api/api.dart';
import 'package:dbro_admin/network/http_util/http_util.dart';
import 'package:dbro_admin/core/dummy/dummy.dart';

class UserDatasource {
  final HttpUtil http;
  UserDatasource(this.http);

  Future<Either<StatusResponse, LoginResponse>> login(
      Map<String, dynamic> body) async {
    try {
      //TODO DUMMY

      // final result = await http.post(
      //   uri: Api.user.login,
      //   body: body,
      // );
      await Future.delayed(const Duration(milliseconds: 1500));
      final result = Dummy.user.login;
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
      //TODO DUMMY

      // final result = await http.post(
      //   uri: Api.user.dropdown,
      // );
      await Future.delayed(const Duration(milliseconds: 1500));
      final result = Dummy.user.dropdown;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(UserDropdownResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }
}
