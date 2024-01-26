import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/data/dto/response/any/get_id_response.dart';
import 'package:dbro_admin/data/dto/response/permission/my_permission_response.dart';
import 'package:dbro_admin/data/dto/response/permission/permission_list_response.dart';
import 'package:dbro_admin/network/api/api.dart';
import 'package:dbro_admin/network/http_util/http_util.dart';

class PermissionDatasource {
  final HttpUtil http;
  PermissionDatasource(this.http);

  Future<Either<Status, GetIdResponse>> permission_create(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await http.post(
        uri: Api.permission.create,
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

  Future<Either<Status, GetIdResponse>> permission_delete(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await http.post(
        uri: Api.permission.delete,
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

  Future<Either<Status, PermissionListResponse>> permission_list(
    Map<String, dynamic> map,
  ) async {
    try {
      final result = await http.get(
        uri: Api.permission.list,
        parameter: map,
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(PermissionListResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<Status, MyPermissionResponse>> get my_permission async {
    try {
      final result = await http.get(uri: Api.permission.my_permission);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(MyPermissionResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }
}
