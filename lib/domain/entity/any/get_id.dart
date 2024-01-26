class GetId {
  final String id;

  GetId({
    this.id = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory GetId.fromMap(Map<String, dynamic> map) {
    return GetId(
      id: map['id'] ?? '',
    );
  }
}
