import 'package:dartz/dartz.dart';
import 'package:dbro_admin/data/dto/response/generic_response.dart';

abstract class HttpUtil {
  Future<Either<Status, Map<String, dynamic>>> get({
    required String uri,
    Map<String, dynamic>? header,
    Map<String, dynamic>? parameter,
  });

  Future<Either<Status, Map<String, dynamic>>> post({
    required String uri,
    Map<String, dynamic>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
  });

  Future<Either<Status, Map<String, dynamic>>> put({
    required String uri,
    Map<String, dynamic>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
  });

  Future<Either<Status, Map<String, dynamic>>> delete({
    required String uri,
    Map<String, dynamic>? header,
    Map<String, dynamic>? parameter,
    Map<String, dynamic>? body,
  });
}
