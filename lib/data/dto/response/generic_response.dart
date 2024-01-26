class Generic {
  final Status status;
  final dynamic data;

  Generic({
    Status? status,
    this.data,
  }) : status = status ?? Status();

  factory Generic.fromJson(Map<String, dynamic> data) {
    return Generic(status: Status.fromMap(data), data: data);
  }

  factory Generic.exception(e) {
    return Generic(
      status: Status.exception(e),
    );
  }
}

class Status {
  final String code;
  final String text;
  final String message;
  final bool failure;

  Status({
    this.code = '',
    this.text = '',
    this.message = '',
    this.failure = false,
  });

  factory Status.fromMap(Map<String, dynamic> map) {
    return Status(
      code: map['code'] ?? '',
      text: map['text'] ?? '',
      message: map['message'] ?? '',
      failure: map['failure'] ?? true,
    );
  }

  factory Status.failure(Map<String, dynamic> map) {
    if (map['message'] != null && map['message'] != "OK") {
      return Status(
        code: map['code'] ?? '',
        text: map['text'] ?? '',
        message: map['message'] ?? '',
        failure: true,
      );
    } else {
      return Status(failure: false);
    }
  }

  factory Status.exception(Object e) {
    return Status(
      text: e.toString(),
      failure: true,
    );
  }
}
