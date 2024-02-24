class PermissionListRequest {
  String roleId;
  num page;
  num size;

  PermissionListRequest({
    this.roleId = '',
    this.page = 0,
    this.size = 0,
  });

  factory PermissionListRequest.bigSize(String roleid) {
    return PermissionListRequest(
      roleId: roleid,
      page: 0,
      size: 200,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'roleId': roleId,
      'page': page,
      'size': size,
    };
  }
}
