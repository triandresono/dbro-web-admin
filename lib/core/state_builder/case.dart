import 'package:dbro_admin/data/dto/response/generic_response.dart';

class Case<T> {
  final T? data;
  final Status failure;

  Case({
    this.data,
    Status? failure,
  }) : failure = failure ?? Status();
}

class InitialCase<T> extends Case<T> {}

class LoadingCase<T> extends Case<T> {}

class NoParameterCase<T> extends Case<T> {}

class UnauthorizedCase<T> extends Case<T> {}

class ErrorCase<T> extends Case<T> {
  ErrorCase(Status failure) : super(failure: failure);
}

class LoadedCase<T> extends Case<T> {
  LoadedCase(T result) : super(data: result);
}
