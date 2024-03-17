import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/datasource/payroll_datasource.dart';
import 'package:dbro_admin/data/repository/payroll/payroll_repository.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/entity/payroll/payroll_user_list.dart';

class PayrollRepositoryImpl extends PayrollRepository {
  final PayrollDatasource datasource;
  PayrollRepositoryImpl(this.datasource);

  @override
  Future<Either<StatusResponse, PayrollUserList>> payrollUser(String id) async {
    try {
      final result = await datasource.payrollUser(id);
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(PayrollUserList.fromMap(result.toMap())),
      );
    } catch (e) {
      if (e is Map) {
        return Left(StatusResponse.failure(e as Map<String, dynamic>));
      } else {
        return Left(StatusResponse(message: e.toString()));
      }
    }
  }
}
