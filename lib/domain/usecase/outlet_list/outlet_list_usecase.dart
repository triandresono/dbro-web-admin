import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/division/outlet_payroll_list.dart';

abstract class OutletListUsecase {
  Future<Either<StatusResponse, OutletPayrollList>> get outletList;
}
