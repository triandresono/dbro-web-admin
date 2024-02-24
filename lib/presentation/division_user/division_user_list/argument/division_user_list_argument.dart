class DivisionUserListArgument {
  final String divisionId;
  DivisionUserListArgument({required this.divisionId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'divisionId': divisionId,
    };
  }

  factory DivisionUserListArgument.fromMap(Map<String, dynamic> map) {
    return DivisionUserListArgument(
      divisionId: map['divisionId'] ?? '',
    );
  }
}
