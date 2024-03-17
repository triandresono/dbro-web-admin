import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/any/get_id_response.dart';
import 'package:dbro_admin/data/response/division/division_dropdown_response.dart';
import 'package:dbro_admin/data/response/division/division_list_response.dart';
import 'package:dbro_admin/data/response/division/outlet_payroll_list_response.dart';
import 'package:dbro_admin/data/response/division/user_division_response.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/network/api/api.dart';
import 'package:dbro_admin/network/http_util/http_util.dart';
// import 'package:dbro_admin/core/dummy/dummy.dart';

class DivisionDatasource {
  final HttpUtil http;
  DivisionDatasource(this.http);

  Future<Either<StatusResponse, DivisionListResponse>> get rootList async {
    try {
      final result = await http.get(
        uri: Api.division.root,
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(DivisionListResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<StatusResponse, DivisionListResponse>> childList(
    String id,
  ) async {
    try {
      final result = await http.get(
        uri: Api.division.child,
        parameter: {'divisionId': id},
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(DivisionListResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<StatusResponse, GetIdResponse>> createDivision(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await http.post(
        uri: Api.division.create,
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

  Future<Either<StatusResponse, DivisionDropdownResponse>> get dropdown async {
    try {
      final result = await http.get(
        uri: Api.division.dropdown,
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(DivisionDropdownResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<StatusResponse, UserDivisionResponse>> get user async {
    try {
      final result = await http.post(
        uri: Api.division.userList,
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(UserDivisionResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<StatusResponse, GetIdResponse>> createDivisionStructure(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await http.post(
        uri: Api.division.createRelation,
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

  Future<Either<StatusResponse, UserDivisionResponse>> userDivision(
    String id,
  ) async {
    try {
      final result = await http.get(
        uri: Api.division.userList,
        parameter: {'divisionId': id},
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(UserDivisionResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<StatusResponse, GetIdResponse>> addUserDivision(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await http.post(
        uri: Api.division.addUser,
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

  Future<Either<StatusResponse, StatusResponse>> removeUserDivision(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await http.post(
        uri: Api.division.removeUser,
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

  Future<Either<StatusResponse, OutletPayrollListResponse>>
      get outletList async {
    try {
      final result = await http.get(
        uri: Api.division.listOutlet,
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(OutletPayrollListResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<StatusResponse, StatusResponse>> updateDivisionPayroll(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await http.post(
        uri: Api.division.updatePayroll,
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
}
