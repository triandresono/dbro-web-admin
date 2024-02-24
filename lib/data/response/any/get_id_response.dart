class GetIdResponse {
  final String id;

  GetIdResponse({
    this.id = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory GetIdResponse.fromMap(Map<String, dynamic> map) {
    return GetIdResponse(
      id: map['id'] ?? '',
    );
  }
}
