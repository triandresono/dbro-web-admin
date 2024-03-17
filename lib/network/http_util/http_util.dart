import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/response/base/status_response.dart';

abstract class HttpUtil {
  Future<Either<StatusResponse, Map<String, dynamic>>> get({
    required String uri,
    Map<String, dynamic>? header,
    Map<String, dynamic>? parameter,
  });

  Future<Either<StatusResponse, Map<String, dynamic>>> post({
    required String uri,
    Map<String, dynamic>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
  });

  Future<Either<StatusResponse, Map<String, dynamic>>> put({
    required String uri,
    Map<String, dynamic>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
  });

  Future<Either<StatusResponse, Map<String, dynamic>>> delete({
    required String uri,
    Map<String, dynamic>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
  });

  Future<Either<StatusResponse, Map<String, dynamic>>> webDownload({
    required String uri,
    Map<String, dynamic>? header,
    Map<String, dynamic>? parameter,
  });
}
