import 'package:dbro_admin/data/response/base/status_response.dart';

class Case<T> {
  final T? data;
  final StatusResponse failure;

  Case({
    this.data,
    StatusResponse? failure,
  }) : failure = failure ?? StatusResponse();
}

class InitialCase<T> extends Case<T> {}

class LoadingCase<T> extends Case<T> {}

class NoParameterCase<T> extends Case<T> {}

class UnauthorizedCase<T> extends Case<T> {}

class ErrorCase<T> extends Case<T> {
  ErrorCase(StatusResponse failure) : super(failure: failure);
}

class LoadedCase<T> extends Case<T> {
  LoadedCase(T result) : super(data: result);
}
