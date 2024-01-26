import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';
import 'package:dbro_admin/domain/entity/any/get_id.dart';
import 'package:dbro_admin/domain/entity/division/division_dropdown.dart';
import 'package:dbro_admin/domain/entity/division/division_list.dart';

abstract class DivisionRepository {
  Future<Either<Status, DivisionList>> get rootList;
  Future<Either<Status, DivisionList>> childList(String id);
  Future<Either<Status, GetId>> createDivision(Map<String, dynamic> body);
  Future<Either<Status, DivisionDropdown>> get dropdown;
  Future<Either<Status, GetId>> createDivisionStructure(
    Map<String, dynamic> body,
  );
}
