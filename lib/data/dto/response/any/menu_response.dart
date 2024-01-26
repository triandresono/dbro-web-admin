class MenuResponse {
  final String menuCode;
  final String menuName;
  final List<MenuResponse> menus;

  MenuResponse({
    required this.menuCode,
    required this.menuName,
    required this.menus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'menuCode': menuCode,
      'menuName': menuName,
      'menus': menus.map((x) => x.toMap()).toList(),
    };
  }

  factory MenuResponse.fromMap(Map<String, dynamic> map) {
    return MenuResponse(
      menuCode: map['menuCode'] ?? '',
      menuName: map['menuName'] ?? '',
      menus: (map['menus']) != null
          ? List<MenuResponse>.from(
              (map['menus'] as List).map<MenuResponse>(
                (x) => MenuResponse.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }
}
