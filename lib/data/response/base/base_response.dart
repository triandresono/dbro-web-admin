import 'package:dbro_admin/data/response/base/status_response.dart';

class BaseResponse {
  final StatusResponse status;
  final dynamic data;

  BaseResponse({
    StatusResponse? status,
    this.data,
  }) : status = status ?? StatusResponse();

  factory BaseResponse.fromJson(Map<String, dynamic> data) {
    return BaseResponse(status: StatusResponse.fromMap(data), data: data);
  }

  factory BaseResponse.exception(e) {
    return BaseResponse(
      status: StatusResponse.exception(e),
    );
  }
}
