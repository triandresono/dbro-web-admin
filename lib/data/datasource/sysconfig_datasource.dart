import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/data/response/any/get_id_response.dart';
import 'package:dbro_admin/data/response/sysconfig/role_dropdown_response.dart';
import 'package:dbro_admin/data/response/sysconfig/sysconfig_list_response.dart';
import 'package:dbro_admin/network/api/api.dart';
import 'package:dbro_admin/network/http_util/http_util.dart';

class SysconfigDatasource {
  final HttpUtil http;
  SysconfigDatasource(this.http);

  Future<Either<StatusResponse, SysconfigListResponse>> sysconfig_list(
    Map<String, dynamic> map,
  ) async {
    try {
      final result = await http.get(
        uri: Api.sysconfig.list,
        parameter: map,
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(SysconfigListResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<StatusResponse, GetIdResponse>> create(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await http.post(
        uri: Api.sysconfig.create,
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

  Future<Either<StatusResponse, RoleDropdownResponse>> get roleDropdown async {
    try {
      final result = await http.get(
        uri: Api.sysconfig.roleDropdown,
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(RoleDropdownResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }
}
