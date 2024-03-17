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
      //TODO DUMMY

      final result = await http.get(
        uri: Api.payroll.userList,
        parameter: {'divisionId': id},
      );

      // await Future.delayed(const Duration(seconds: 1));
      // final result = Dummy.division.root;
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(PayrollUserListResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }
}
