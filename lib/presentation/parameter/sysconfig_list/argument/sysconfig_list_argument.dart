class SysconfigListArgument {
  final String id;
  final String type;
  SysconfigListArgument({
    required this.id,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
    };
  }

  factory SysconfigListArgument.fromMap(Map<String, dynamic> map) {
    return SysconfigListArgument(
      id: map['id'] ?? '',
      type: map['type'] ?? '',
    );
  }
}
