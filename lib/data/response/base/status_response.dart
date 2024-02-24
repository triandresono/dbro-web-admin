class StatusResponse {
  final String code;
  final String text;
  final String message;
  final bool failure;

  StatusResponse({
    this.code = '',
    this.text = '',
    this.message = '',
    this.failure = false,
  });

  factory StatusResponse.fromMap(Map<String, dynamic> map) {
    return StatusResponse(
      code: map['code'] ?? '',
      text: map['text'] ?? '',
      message: map['message'] ?? '',
      failure: map['failure'] ?? true,
    );
  }

  factory StatusResponse.failure(Map<String, dynamic> map) {
    if (map['message'] != null && map['message'] != "OK") {
      return StatusResponse(
        code: map['code'] ?? '',
        text: map['text'] ?? '',
        message: map['message'] ?? '',
        failure: true,
      );
    } else {
      return StatusResponse(failure: false);
    }
  }

  factory StatusResponse.exception(Object e) {
    return StatusResponse(
      text: e.toString(),
      failure: true,
    );
  }
}
