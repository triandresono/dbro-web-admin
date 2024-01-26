import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/data/dto/response/any/get_id_response.dart';
import 'package:dbro_admin/data/dto/response/sysconfig/sysconfig_list_response.dart';
import 'package:dbro_admin/network/api/api.dart';
import 'package:dbro_admin/network/http_util/http_util.dart';

class SysconfigDatasource {
  final HttpUtil http;
  SysconfigDatasource(this.http);

  Future<Either<Status, SysconfigListResponse>> sysconfig_list(
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

  Future<Either<Status, GetIdResponse>> create(
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
}
