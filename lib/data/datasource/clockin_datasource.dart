import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/data/response/clockin/clockin_user_list_reponse.dart';
import 'package:dbro_admin/network/api/api.dart';
import 'package:dbro_admin/network/http_util/http_util.dart';

class ClockinDatasource {
  final HttpUtil http;
  ClockinDatasource(this.http);

  Future<Either<StatusResponse, ClockInUserListResponse>> userList(
    String id,
  ) async {
    try {
      final result = await http.get(
        uri: Api.clockin.userList,
        parameter: {'userAuthId': id},
      );
      return result.fold(
        (failure) => Left(failure),
        (result) => Right(ClockInUserListResponse.fromMap(result)),
      );
    } catch (e) {
      rethrow;
    }
  }
}
