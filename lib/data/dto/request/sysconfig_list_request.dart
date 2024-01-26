class SysconfigListRequest {
  String type;
  num page;
  num size;

  SysconfigListRequest({
    this.type = '',
    this.page = 0,
    this.size = 5,
  });

  factory SysconfigListRequest.init(String type) {
    return SysconfigListRequest(
      type: type,
      page: 0,
      size: 5,
    );
  }

  factory SysconfigListRequest.role() {
    return SysconfigListRequest(
      type: "ROLE",
      page: 0,
      size: 5,
    );
  }

  factory SysconfigListRequest.api_path() {
    return SysconfigListRequest(
      type: "API_PATH",
      page: 0,
      size: 200,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'page': page,
      'size': size,
    };
  }
}
