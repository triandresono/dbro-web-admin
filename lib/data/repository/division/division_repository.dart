import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/entity/division/division_dropdown.dart';
import 'package:dbro_admin/domain/entity/division/division_list.dart';
import 'package:dbro_admin/domain/entity/division/user_division.dart';

abstract class DivisionRepository {
  Future<Either<StatusResponse, GetId>> addUserDivision(
      Map<String, dynamic> body);
  Future<Either<StatusResponse, DivisionList>> get rootList;
  Future<Either<StatusResponse, DivisionList>> childList(String id);
  Future<Either<StatusResponse, GetId>> createDivision(
      Map<String, dynamic> body);
  Future<Either<StatusResponse, DivisionDropdown>> get dropdown;
  Future<Either<StatusResponse, UserDivision>> userDivision(String id);
  Future<Either<StatusResponse, GetId>> createDivisionStructure(
    Map<String, dynamic> body,
  );
}
