import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';
import 'package:dbro_admin/domain/usecase/local/local_usecase.dart';
import 'package:dbro_admin/network/http_util/http_util.dart';
import 'package:dbro_admin/network/http_logger/logging_interceptor.dart';
import 'package:universal_html/html.dart' as html;
// import 'package:dio/browser.dart';
import 'package:dio/dio.dart';
part 'http_util_extender.dart';

class HttpUtilImpl with _Extender implements HttpUtil {
  HttpUtilImpl(LocalUsecase usecase) {
    this.usecase = usecase;
    // _dio.httpClientAdapter = BrowserHttpClientAdapter(withCredentials: true);
    _dio.options.connectTimeout = const Duration(milliseconds: 30000);
    _dio.options.receiveTimeout = const Duration(milliseconds: 30000);
    _dio.interceptors.add(LoggingInterceptor());
  }

  @override
  Future<Either<StatusResponse, Map<String, dynamic>>> get({
    required String uri,
    Map<String, dynamic>? header,
    Map<String, dynamic>? parameter,
  }) async {
    try {
      _dio.options.headers = _setHeader(header);
      final response = await _dio.get(
        uri,
        queryParameters: parameter,
      );
      return (this).dio_response(response);
    } on DioException catch (e) {
      return Left((this).dio_catch(e));
    }
  }

  @override
  Future<Either<StatusResponse, Map<String, dynamic>>> post({
    required String uri,
    Map<String, dynamic>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
  }) async {
    try {
      _dio.options.headers = _setHeader(header);
      final response = await _dio.post(
        uri,
        data: body,
        queryParameters: parameter,
      );
      return (this).dio_response(response);
    } on DioException catch (e) {
      return Left((this).dio_catch(e));
    }
  }

  @override
  Future<Either<StatusResponse, Map<String, dynamic>>> delete({
    required String uri,
    Map<String, dynamic>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
  }) async {
    _dio.options.headers = _setHeader(header);
    try {
      final response = await _dio.delete(
        uri,
        data: body,
      );
      return (this).dio_response(response);
    } on DioException catch (e) {
      return Left((this).dio_catch(e));
    }
  }

  @override
  Future<Either<StatusResponse, Map<String, dynamic>>> put({
    required String uri,
    Map<String, dynamic>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
  }) async {
    _dio.options.headers = _setHeader(header);
    try {
      final response = await _dio.put(
        uri,
        data: body,
        queryParameters: parameter,
      );
      return (this).dio_response(response);
    } on DioException catch (e) {
      return Left((this).dio_catch(e));
    }
  }

  @override
  Future<Either<StatusResponse, Map<String, dynamic>>> webDownload({
    required String uri,
    Map<String, dynamic>? header,
    Map<String, dynamic>? parameter,
  }) async {
    const dataType = 'data:application/octet-stream';
    try {
      _dio.options.headers = _setHeader(header);
      final response = await _dio.get(
        uri,
        queryParameters: parameter,
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );
      final base64data = base64Encode(response.data);
      final web = html.AnchorElement(href: '$dataType;base64,$base64data');
      final disposition = response.headers.value("content-disposition");
      if (disposition != null) {
        final index = disposition.indexOf("filename=") + "filename=".length;
        web.download = disposition.substring(index);
        web.click();
        web.remove();
      } else {
        web.download = 'download.xlsx';
        web.click();
        web.remove();
      }

      return const Right({});
    } on DioException catch (e) {
      return Left((this).dio_catch(e));
    }
  }
}
