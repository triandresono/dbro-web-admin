class EditRoleArgument {
  final String id;
  final String role;
  EditRoleArgument({
    required this.id,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'role': role,
    };
  }

  factory EditRoleArgument.fromMap(Map<String, dynamic> map) {
    return EditRoleArgument(
      id: map['id'] ?? '',
      role: map['role'] ?? '',
    );
  }
}
