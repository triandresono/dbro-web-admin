part of 'http_util_impl.dart';

mixin class _Extender {
  late LocalUsecase usecase;
  final _dio = Dio();

  Map<String, dynamic> get _defaultHeader {
    Map<String, String> headers = {};
    headers['Content-Type'] = 'application/json';
    headers['accept'] = 'application/json';
    headers['Access-Control-Allow-Origin'] = '*';
    if (usecase.get_user.token.isNotEmpty) {
      headers['Authorization'] = 'Bearer ${usecase.get_user.token}';
    }
    return headers;
  }

  Map<String, dynamic> _setHeader(Map<String, dynamic>? headers) {
    Map<String, dynamic> httpHeaders = _defaultHeader;
    if (headers != null) {
      headers.forEach((key, value) {
        httpHeaders[key] = value;
      });
    }
    return httpHeaders;
  }

  Either<StatusResponse, Map<String, dynamic>> dio_response(
    Response<dynamic> response,
  ) {
    if (response.statusCode != 200) {
      return Left(StatusResponse(
        code: (response.statusCode ?? 400).toString(),
        message: response.data?['message'] ?? response.statusMessage,
      ));
    } else {
      if (response.data is List) {
        return Right({"list": response.data});
      } else {
        return Right(response.data);
      }
    }
  }

  StatusResponse dio_catch(DioException e) {
    if (e.response?.data is Map) {
      return StatusResponse(
        code: (e.response?.statusCode ?? 400).toString(),
        message: e.response?.data['message'] ?? e.message,
      );
    } else {
      final code = e.response?.statusCode ?? 400;
      return StatusResponse(
        code: (e.response?.statusCode ?? 400).toString(),
        message: e.message ?? "Exception with code [${(code)}]",
      );
    }
  }
}
