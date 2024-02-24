import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/data/response/sysconfig/sysconfig_detail_response.dart';
import 'package:dbro_admin/data/response/sysconfig/sysconfig_type_list_response.dart';
import 'package:dbro_admin/network/api/api.dart';
import 'package:dbro_admin/network/http_util/http_util.dart';

class SysconfigTypeDatasource {
  final HttpUtil http;
  SysconfigTypeDatasource(this.http);

  Future<Either<StatusResponse, SysconfigDetailResponse>> getDetail(
      String name) async {
    try {
      final result = await http.get(
        uri: Api.sysconfig_type.detail,
        parameter: {"name": name},
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(SysconfigDetailResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<StatusResponse, SysconfigTypeListResponse>> get list async {
    try {
      final result = await http.get(
        uri: Api.sysconfig_type.list,
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(SysconfigTypeListResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }
}
