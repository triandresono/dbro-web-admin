import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/data/response/payrolll/payroll_user_list_response.dart';
import 'package:dbro_admin/network/api/api.dart';
import 'package:dbro_admin/network/http_util/http_util.dart';

class PayrollDatasource {
  final HttpUtil http;
  PayrollDatasource(this.http);

  Future<Either<StatusResponse, PayrollUserListResponse>> payrollUser(
    String id,
  ) async {
    try {
      final result = await http.get(
        uri: Api.payroll.userList,
        parameter: {'divisionId': id},
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(PayrollUserListResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<StatusResponse, dynamic>> calculatePayroll(
    Map<String, dynamic> parameter,
  ) async {
    try {
      final result = await http.webDownload(
        uri: Api.payroll.calulatePayroll,
        parameter: parameter,
        header: {
          'Content-Type': 'application/octet-stream',
          'accept': 'application/octet-stream',
        },
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(result),
      );
    } catch (e) {
      rethrow;
    }
  }
}
