import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/any/get_id_response.dart';
import 'package:dbro_admin/data/dto/response/division/division_dropdown_response.dart';
import 'package:dbro_admin/data/dto/response/division/division_list_response.dart';
import 'package:dbro_admin/data/dto/response/division/user_division_response.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/network/http_util/http_util.dart';
import 'package:dbro_admin/utils/dummy/dummy.dart';

class DivisionDatasource {
  final HttpUtil http;
  DivisionDatasource(this.http);

  Future<Either<Status, DivisionListResponse>> get rootList async {
    try {
      //TODO DUMMY

      // final result = await http.get(
      //   uri: Api.division.root,
      // );

      await Future.delayed(const Duration(seconds: 1));
      final result = Dummy.division.root;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(DivisionListResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<Status, DivisionListResponse>> childList(String id) async {
    try {
      //TODO DUMMY

      // final result = await http.get(
      //   uri: Api.division.root,
      // );

      await Future.delayed(const Duration(seconds: 1));
      final result = Dummy.division.root;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(DivisionListResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<Status, GetIdResponse>> createDivision(
    Map<String, dynamic> body,
  ) async {
    try {
      //TODO DUMMY

      // final result = await http.post(
      //   uri: Api.division.create,
      // );

      await Future.delayed(const Duration(seconds: 1));
      final result = Dummy.division.id;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(GetIdResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<Status, DivisionDropdownResponse>> get dropdown async {
    try {
      //TODO DUMMY

      // final result = await http.post(
      //   uri: Api.division.create,
      // );

      await Future.delayed(const Duration(seconds: 1));
      final result = Dummy.division.dropdown;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(DivisionDropdownResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<Status, UserDivisionResponse>> get user async {
    try {
      //TODO DUMMY

      // final result = await http.post(
      //   uri: Api.division.create,
      // );

      await Future.delayed(const Duration(seconds: 1));
      final result = Dummy.division.user;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(UserDivisionResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<Status, GetIdResponse>> createDivisionStructure(
    Map<String, dynamic> body,
  ) async {
    try {
      //TODO DUMMY

      // final result = await http.post(
      //   uri: Api.division.create,
      // );

      await Future.delayed(const Duration(seconds: 1));
      final result = Dummy.division.id;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(GetIdResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }
}
